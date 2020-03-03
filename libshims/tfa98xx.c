#include <stdlib.h>
#include <log/log.h>
#include <cutils/trace.h>
#include <cutils/str_parms.h>
#include <cutils/properties.h>
#include "audio_hw.h"
#include "tfa98xx.h"

struct pcm *tfa98xx_out;

struct pcm_config pcm_config_tfa98xx = {
    .channels = 2,
    .rate = 48000,
    .period_size = 256,
    .period_count = 4,
    .format = PCM_FORMAT_S16_LE,
    .start_threshold = 0,
    .stop_threshold = INT_MAX,
    .silence_threshold = 0,
};

int enable_snd_device(struct audio_device *adev,
                      snd_device_t snd_device)
{
	tfa98xx_start_feedback(adev, snd_device);
}

bool isRightMode(snd_device_t snd_device)
{
    ALOGD("%s: snd_device is %d", __func__, snd_device);
    switch(snd_device) {
    case SND_DEVICE_OUT_SPEAKER:
    case SND_DEVICE_OUT_SPEAKER_REVERSE:
    case SND_DEVICE_OUT_SPEAKER_AND_HEADPHONES:
    case SND_DEVICE_OUT_SPEAKER_AND_LINE:
    case SND_DEVICE_OUT_VOICE_SPEAKER:
    case SND_DEVICE_OUT_VOICE_SPEAKER_2:
    case SND_DEVICE_OUT_SPEAKER_AND_HDMI:
    case SND_DEVICE_OUT_SPEAKER_AND_USB_HEADSET:
    case SND_DEVICE_OUT_SPEAKER_AND_ANC_HEADSET:
        return true;
    default:
        return false;
    }
}

int tfa98xx_start_feedback(struct audio_device *adev, snd_device_t snd_device)
{
    struct audio_usecase *uc_info_rx = NULL;
    int rx_device_id;
    int res, ret_val;

    if (isRightMode(snd_device) == 0)
        return 0;
    ALOGD("%s: isRightMode: true", __func__);

    if (adev == NULL) {
        ALOGE("%s: Invalid params", __func__);
        return -EINVAL;
    }

    if (tfa98xx_out != NULL)
        return 0;

    uc_info_rx = (struct audio_usecase *)calloc(1, sizeof(struct audio_usecase));
    if (uc_info_rx == NULL)
        return -ENOMEM;

    uc_info_rx->id = USECASE_AUDIO_SPKR_CALIB_TX;
    uc_info_rx->type = PCM_CAPTURE;
    uc_info_rx->in_snd_device = SND_DEVICE_IN_CAPTURE_VI_FEEDBACK;

    list_add_tail(&adev->usecase_list, &uc_info_rx->list);
    enable_snd_device(adev, SND_DEVICE_IN_CAPTURE_VI_FEEDBACK);
    enable_audio_route(adev, uc_info_rx);

    rx_device_id = platform_get_pcm_device_id(uc_info_rx->id, 1);
    if (rx_device_id < 0) {
        ALOGE("%s: Invalid pcm device for usecase (%d)", __func__, uc_info_rx->id);
        ret_val = -ENODEV;
        goto error;
    }
    else {
        tfa98xx_out = pcm_open(adev->snd_card, rx_device_id, PCM_IN, &pcm_config_tfa98xx);
        if ((tfa98xx_out == NULL) || pcm_is_ready(tfa98xx_out)) {
            res = pcm_start(tfa98xx_out);

            if (res < 0) {
                ALOGE("%s: pcm start for TX failed", __func__);
                ret_val = -EBUSY;
                goto error;
            }
            return 0;
        }
        else {
            ALOGE("%s: %s", __func__, pcm_get_error(tfa98xx_out));
            ret_val = -EIO;
            goto error;
        }
    }

error:
    ALOGE("%s: error case...", __func__);
    if (tfa98xx_out != 0)
        pcm_close(tfa98xx_out);
    tfa98xx_out = NULL;
    disable_snd_device(adev, SND_DEVICE_IN_CAPTURE_VI_FEEDBACK);
    list_remove(&uc_info_rx->list);
    uc_info_rx->id = USECASE_AUDIO_SPKR_CALIB_TX;
    uc_info_rx->type = PCM_PLAYBACK;
    uc_info_rx->in_snd_device = SND_DEVICE_IN_CAPTURE_VI_FEEDBACK;
    disable_audio_route(adev, uc_info_rx);
    free(uc_info_rx);

    return ret_val;
}


void tfa98xx_stop_feedback(struct audio_device *adev, snd_device_t snd_device)
{
    struct audio_usecase *usecase;

    if (isRightMode(snd_device))
    {
        usecase = get_usecase_from_list(adev, USECASE_AUDIO_SPKR_CALIB_TX);
        if (tfa98xx_out)
        {
            pcm_close(tfa98xx_out);
        }
        tfa98xx_out = NULL;

        disable_snd_device(adev, SND_DEVICE_IN_CAPTURE_VI_FEEDBACK);
        if (usecase)
        {
            list_remove(&usecase->list);
            disable_audio_route(adev, usecase);
            free(usecase);
        }
    }
}

int disable_snd_device(struct audio_device *adev,
                       snd_device_t snd_device)
{
	if (!adev->snd_dev_ref_cnt[snd_device] == 0) {
		tfa98xx_stop_feedback(adev, snd_device);
	}
}
