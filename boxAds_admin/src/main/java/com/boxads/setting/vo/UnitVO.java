package com.boxads.setting.vo;

import java.util.Arrays;

public class UnitVO {
	
	private int idx;
	private int cIdx;
	private int writer;
	private String uCode;
	private int min;
	private int max;
	private int oneSide;
	private int twoSide;
	private String insertDate;
	private String type;
	
	private int[] idxArr;
	private String[] uCodeArr;
	private int[] minArr;
	private int[] maxArr;
	private int[] oneSideArr;
	private int[] twoSideArr;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getuCode() {
		return uCode;
	}
	public void setuCode(String uCode) {
		this.uCode = uCode;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getOneSide() {
		return oneSide;
	}
	public void setOneSide(int oneSide) {
		this.oneSide = oneSide;
	}
	public int getTwoSide() {
		return twoSide;
	}
	public void setTwoSide(int twoSide) {
		this.twoSide = twoSide;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int[] getIdxArr() {
		return idxArr;
	}
	public void setIdxArr(int[] idxArr) {
		this.idxArr = idxArr;
	}
	public String[] getuCodeArr() {
		return uCodeArr;
	}
	public void setuCodeArr(String[] uCodeArr) {
		this.uCodeArr = uCodeArr;
	}
	public int[] getMinArr() {
		return minArr;
	}
	public void setMinArr(int[] minArr) {
		this.minArr = minArr;
	}
	public int[] getMaxArr() {
		return maxArr;
	}
	public void setMaxArr(int[] maxArr) {
		this.maxArr = maxArr;
	}
	public int[] getOneSideArr() {
		return oneSideArr;
	}
	public void setOneSideArr(int[] oneSideArr) {
		this.oneSideArr = oneSideArr;
	}
	public int[] getTwoSideArr() {
		return twoSideArr;
	}
	public void setTwoSideArr(int[] twoSideArr) {
		this.twoSideArr = twoSideArr;
	}
	@Override
	public String toString() {
		return "UnitVO [idx=" + idx + ", cIdx=" + cIdx + ", writer=" + writer + ", uCode=" + uCode + ", min=" + min
				+ ", max=" + max + ", oneSide=" + oneSide + ", twoSide=" + twoSide + ", insertDate=" + insertDate
				+ ", type=" + type + ", idxArr=" + Arrays.toString(idxArr) + ", uCodeArr=" + Arrays.toString(uCodeArr)
				+ ", minArr=" + Arrays.toString(minArr) + ", maxArr=" + Arrays.toString(maxArr) + ", oneSideArr="
				+ Arrays.toString(oneSideArr) + ", twoSideArr=" + Arrays.toString(twoSideArr) + "]";
	}
	
	

}
