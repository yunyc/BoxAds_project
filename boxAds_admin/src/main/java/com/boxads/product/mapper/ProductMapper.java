package com.boxads.product.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.product.vo.ProductVO;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;

@Mapper
public interface ProductMapper {
	
	List<ProductVO> selectProductList(ProductVO pvo) throws Exception;
	int updateProductList(ProductVO pvo) throws Exception;
	int deleteProductList(ProductVO pvo) throws Exception;
	
	HashMap<String, Long> selectProductCnt(ProductVO pvo) throws Exception;
	
	void insertReason(HashMap<String, Object> param) throws Exception;
	
	List<HashMap<String, Object>> selectReason(HashMap<String, Object> param) throws Exception;
	
}