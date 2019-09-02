package com.zzz.pojo;

public class TbRoleMenu {
	private Long menuId;

	private Long roleId;

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(" [");
		sb.append("Hash = ").append(hashCode());
		sb.append(", menuId=").append(menuId);
		sb.append(", roleId=").append(roleId);
		sb.append("]");
		return sb.toString();
	}
}
