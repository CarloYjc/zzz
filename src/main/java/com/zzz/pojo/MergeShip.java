package com.zzz.pojo;

import java.util.List;

/**
 * 
 * @author Car1o  
 * 2019-07-19
 */
public class MergeShip {
    private Long oid;
    private String sid;
    private List<TbActualOrderInfo> data;

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public List<TbActualOrderInfo> getData() {
        return data;
    }

    public void setData(List<TbActualOrderInfo> data) {
        this.data = data;
    }

}
