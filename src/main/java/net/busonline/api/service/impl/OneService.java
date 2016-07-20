package net.busonline.api.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.busonline.api.dao.OneMapper;
import net.busonline.api.service.IOneService;

@Service
public class OneService implements IOneService {
	@Autowired
	private OneMapper oneMapper;

	@Override
	public Map<String, Object> select() {
		// TODO Auto-generated method stub
		Map<String,Object>map = oneMapper.getOneById("1");
		System.out.println(map.get("name"));
		return map;
	}
}
