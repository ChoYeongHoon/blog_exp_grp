/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.blog.exp.campaigns.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.exp.campaigns.service.CampaignsService;
import com.blog.exp.campaigns.service.SearchService;

@Controller
@RequestMapping(value = "/api")
public class SearchController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CampaignsService.class);
	
	private static final String PRE_FIX = "/Search";

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "searchService")
	private SearchService searchService;
	
	/**
	 * 검색 정보 리스트
	 * 
	 * @param String
	 * @return resultDTO
	 * @throws Exception
	 */
	@RequestMapping(value = PRE_FIX + "/selectSearchInfoList.do", method = { RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> selectSearchInfoList(@RequestBody Map<String, Object> parameter, HttpServletRequest request) throws Exception {
		// result
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		// parameter
		Map<String, Object> param = new HashMap<String, Object>();
		
		try {
			// 페이징
			int page = parameter.get("pageNo") != null ? Integer.parseInt(parameter.get("pageNo").toString()) : 1;
			int pageSize = propertiesService.getInt("pageSize");
			
			int offset = (page - 1) * pageSize;
			
			param.put("limit", pageSize);
			param.put("offset", offset);
			
			
			String keyword = parameter.get("keyword") != null ? parameter.get("keyword").toString() : ""; // 검색 키워드
			String region1 = parameter.get("region1") != null ? parameter.get("region1").toString() : "0"; // 시/도
			String region2 = parameter.get("region2") != null ? parameter.get("region2").toString() : "0"; // 구/군
			String category = parameter.get("category") != null ? parameter.get("category").toString() : "0"; // 카테고리
			String channel = parameter.get("channel") != null ? parameter.get("channel").toString() : "0"; // 채널
			String type = parameter.get("type") != null ? parameter.get("type").toString() : "0"; // 유형(타입)
			String sort = parameter.get("sort") != null ? parameter.get("sort").toString() : "0"; // 정렬
			
			param.put("keyword", keyword);
			param.put("region1", region1);
			param.put("region2", region2);
			param.put("category", category);
			param.put("channel", channel);
			param.put("type", type);
			param.put("sort", sort);
			
			resultList = searchService.selectSearchInfoList(param);
			
		} catch (Exception e) {
			LOGGER.error(e.getMessage(),e);
		}
		
		return resultList;
	}

}
