package com.zzz.pojo;

import java.math.BigDecimal;

public class TbActualOrder {
    private Long aid;

    private Long oid;

    private String orderDate;

    private String custName;

    private BigDecimal tamt;

    private String orderStatus;

    private BigDecimal atamt;

    private String sid;

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName == null ? null : custName.trim();
    }

    public BigDecimal getTamt() {
        return tamt;
    }

    public void setTamt(BigDecimal tamt) {
        this.tamt = tamt;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public BigDecimal getAtamt() {
        return atamt;
    }

    public void setAtamt(BigDecimal atamt) {
        this.atamt = atamt;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }
}