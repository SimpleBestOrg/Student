package cn.com.zzzy.entity;

public class TalkingPhoto {
    private Integer talkingPhotoId;
    private Integer talkingId; // 外键说说ID
    private String talkingPhoto;// 说说图片路径

    public Integer getTalkingPhotoId() {
        return talkingPhotoId;
    }

    public void setTalkingPhotoId(Integer talkingPhotoId) {
        this.talkingPhotoId = talkingPhotoId;
    }

    public Integer getTalkingId() {
        return talkingId;
    }

    public void setTalkingId(Integer talkingId) {
        this.talkingId = talkingId;
    }

    public String getTalkingPhoto() {
        return talkingPhoto;
    }

    public void setTalkingPhoto(String talkingPhoto) {
        this.talkingPhoto = talkingPhoto;
    }

}
