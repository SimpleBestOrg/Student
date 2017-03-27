package cn.com.zzzy.entity;

/**
 * 说说权限表
 * @author Admin
 *
 */
public class TalkingAuthority {
    private int talkingAuthorityId;// 说说可见性ID
    private String talkingAuthorityName;// 说说可见性名称

    public int getTalkingAuthorityId() {
        return talkingAuthorityId;
    }

    public void setTalkingAuthorityId(int talkingAuthorityId) {
        this.talkingAuthorityId = talkingAuthorityId;
    }

    public String getTalkingAuthorityName() {
        return talkingAuthorityName;
    }

    public void setTalkingAuthorityName(String talkingAuthorityName) {
        this.talkingAuthorityName = talkingAuthorityName;
    }


}
