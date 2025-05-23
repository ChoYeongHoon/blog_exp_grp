/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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
package com.blog.exp.campaigns.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository("searchMapper")
public class SearchMapper extends EgovAbstractMapper {
	
	// 검색 정보 리스트
	public List<Map<String, Object>> selectSearchInfoList(Map<String, Object> parameter) throws Exception {
		System.out.println(parameter.toString());
		return this.selectList("SearchMapper.SEL_SEARCH_INFO_LIST", parameter);
	}

}
