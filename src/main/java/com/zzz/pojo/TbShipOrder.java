package com.zzz.pojo;

public class TbShipOrder {
    private Long sid;

    private Long oid;

    private String shipDate;

    private String shipStatus;

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate == null ? null : shipDate.trim();
    }

    public String getShipStatus() {
        return shipStatus;
    }

    public void setShipStatus(String shipStatus) {
        this.shipStatus = shipStatus == null ? null : shipStatus.trim();
    }
}