package com.zzz.pojo;

import java.math.BigDecimal;

public class TbActualOrderInfo {
    private Long id;

    private Long aid;

    private String itemno;

    private Integer num;

    private BigDecimal aprice;

    private BigDecimal amt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public String getItemno() {
        return itemno;
    }

    public void setItemno(String itemno) {
        this.itemno = itemno == null ? null : itemno.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public BigDecimal getAprice() {
        return aprice;
    }

    public void setAprice(BigDecimal aprice) {
        this.aprice = aprice;
    }

    public BigDecimal getAmt() {
        return amt;
    }

    public void setAmt(BigDecimal amt) {
        this.amt = amt;
    }
}