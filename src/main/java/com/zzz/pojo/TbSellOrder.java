package com.zzz.pojo;

import java.math.BigDecimal;

public class TbSellOrder {
    private Long oid;

    private String custName;

    private String orderDate;

    private String deliDate;

    private String orderStatus;

    private String note;

    private String status;

    private BigDecimal tamt;

    private BigDecimal atamt;

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName == null ? null : custName.trim();
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getDeliDate() {
        return deliDate;
    }

    public void setDeliDate(String deliDate) {
        this.deliDate = deliDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public BigDecimal getTamt() {
        return tamt;
    }

    public void setTamt(BigDecimal tamt) {
        this.tamt = tamt;
    }

    public BigDecimal getAtamt() {
        return atamt;
    }

    public void setAtamt(BigDecimal atamt) {
        this.atamt = atamt;
    }
}