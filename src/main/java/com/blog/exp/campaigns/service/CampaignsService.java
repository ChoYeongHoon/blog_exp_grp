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
package com.blog.exp.campaigns.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.blog.exp.campaigns.mapper.CampaignsMapper;

@Service("campaignsService")
public class CampaignsService extends EgovAbstractServiceImpl {

	private static final Logger LOGGER = LoggerFactory.getLogger(CampaignsService.class);

	@Resource(name="campaignsMapper")
	private CampaignsMapper campaignsMapper;
	
	// 캠페인 정보 리스트
	public List<Map<String, Object>> selectCampaignsInfoList(Map<String, Object> parameter) throws Exception {
		return this.campaignsMapper.selectCampaignsInfoList(parameter);
	}

}
