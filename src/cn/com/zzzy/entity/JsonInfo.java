package cn.com.zzzy.entity;


public class JsonInfo {
    private Integer flag;
    private String url;
    
    public JsonInfo(Integer flag,String url){
         this.flag =  flag;
         this.url = url;
    }
    
    
    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String geturl() {
        return url;
    }

    public void seturl(String url) {
        this.url = url;
    }

}
