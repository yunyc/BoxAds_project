<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="guide02" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title" >이미지 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts scroll">
							<div class="tab-content_wrap">
								<div class="tab-content" style="display:block;padding-top: 0;">
									<p class="tab_title">인쇄용 광고 이미지 등록 가이드</p>
									<p>애드 상품에 등록할 광고 이미지는 인쇄용과 샘플 사진으로 구분됩니다. <br>
										인쇄용은 등록 이미지를 그대로 다운받아 수정없이 즉시 제작을 하게 되어, 최소 규격의 이미지를 등록해주셔야
										균일한 품질의 홍보물이 제작 되어 전국 고객에게 배포됩니다. 샘플 사진은 크기와 두께, 무게를 가늠하기 쉬운 
										사진을 등록해주세요. 샘플이 택배 무게에 영향을 주면 택배 동봉에 어려움이 발생합니다.</p>
									<div class="img_gd_con">
										<div class="img_gd_tit">
											· 인쇄용 광고 이미지 규격
										</div>
										<div class="table_wrap">
											<table>
												<caption>인쇄용 광고 이미지 규격 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th rowspan="2">전단지 종류</th>
														<th colspan="3">광고 이미지</th>
														<th colspan="2">인쇄 방식</th>
													</tr>
													<tr>
														<th>재단 사이즈</th>
														<th>작업 사이즈</th>
														<th>파일 포맷</th>
														<th>이미지수</th>
														<th>인쇄면</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>전단지-A4</th>
														<td>210 x 297 </td>
														<td>214 x 301</td>
														<td rowspan="5">JPG , GIF</td>
														<td rowspan="3">1장 / 2장</td>
														<td rowspan="3">단면 / 양면</td>
													</tr>
													<tr>
														<th>전단지 - B5</th>
														<td>183 x 258</td>
														<td>187 x 262</td>
													</tr>
													<tr>
														<th>전단지 - 쿠폰</th>
														<td>150 x 70</td>
														<td>154 x 74</td>
													</tr>
													<tr>
														<th>스티커 - 중</th>
														<td>148 x 210</td>
														<td>152 x 214</td>
														<td rowspan="2">1장</td>
														<td rowspan="2">단면</td>
													</tr>
													<tr>
														<th>스티커 - 소</th>
														<td>148 x 80</td>
														<td>152 x 84</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="gray_tit">※ 디자인 파일 제작 및 인쇄물 주의 사항</div>
										<div class="gray_box">
											<p>
												- 원본 디자인 시 해상도를 300dpi의 고해상도로 설정 후 사이즈에 맞게 작업. <br>
												- 색상모드는 반드시 CMYK 선택 후 작업 (RGB에서 변환 시 색상과 인쇄질 차이가 큼) <br>
												- 등록 가능 이미지 파일 포맷은 JPG, GIF이며, 저장 시 최고 품질로 설정 후 저장 <br>
												- 인쇄물 재단 및 가공 시 1~2mm 오차가 날 수 있어 테두리 부분에 중요정보 표시 주의 <br>
												- 진한색상의 인쇄물은 뒷묻음이 발생 할 수 있음
											</p>
										</div>
									</div>
									<div class="img_gd_con">
										<div class="img_gd_tit"> · 인쇄 재질 소개</div>
										<div class="gray_tit">전단지/쿠폰 : 미스틱 157g</div>
										<div class="gray_box">
											<p>
												미스틱은 기존 매트지 대비 두께감이 우수한 하이벌크매트지로 가볍고 부드러운 새로운 질감의 선진국형 잡지용지입니다. 스노우와 백상지 중간형으로 볼 수 있으며 용지 자체는 무광을 띠며, 면성이 양호합니다.
											</p>
										</div>
										<div class="img_pop">
											<div class="a4"><a href="javascript:modal_open('guide03');"></a></div>
											<div class="b5"><a href="javascript:modal_open('guide03');"></a></div>
											<div class="cou"><a href="javascript:modal_open('guide03');"></a></div>
										</div>
										<div class="gray_tit">스티커 : 아트지 (무광코팅)</div>
										<div class="gray_box">
											<p>
												순백색의 색상으로 국내 최고의 백상도를 실현한 아트지는 탁월한 면성과 광택, 균일한 선명성으로 원하시는 색상을 생생하게 재현합니다. 밝은 순백색의 고 광택 프리미엄 용지 입니다. <br>
											</p>
										</div>
										<div class="img_pop">
											<div class="md_sti"><a href="javascript:modal_open('guide03');"></a></div>
											<div class="sm_sti"><a href="javascript:modal_open('guide03');"></a></div>
										</div>
									</div>

								</div>	
							</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">UI.GuideTab();</script>
	</div>