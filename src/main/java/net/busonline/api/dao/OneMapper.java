package net.busonline.api.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OneMapper {
	public Map<String, Object> getOneById(@Param("id") String id);
}
