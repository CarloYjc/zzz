package com.zzz.pojo;

import java.math.BigDecimal;

public class TbItem {
    private Long id;

    private String itemno;

    private String itemName;

    private BigDecimal price;

    private String itemSpec;

    private String weight;

    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItemno() {
        return itemno;
    }

    public void setItemno(String itemno) {
        this.itemno = itemno == null ? null : itemno.trim();
    }

    public TbItem() {
        super();
    }

    public TbItem(Long id, String itemno, String itemName, BigDecimal price, String itemSpec, String weight,
            String status) {
        super();
        this.id = id;
        this.itemno = itemno;
        this.itemName = itemName;
        this.price = price;
        this.itemSpec = itemSpec;
        this.weight = weight;
        this.status = status;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getItemSpec() {
        return itemSpec;
    }

    public void setItemSpec(String itemSpec) {
        this.itemSpec = itemSpec == null ? null : itemSpec.trim();
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight == null ? null : weight.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}