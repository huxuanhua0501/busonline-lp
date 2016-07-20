package net.busonline.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.busonline.api.service.IOneService;
import net.busonline.core.base.BaseController;

@RestController
@RequestMapping("/oneController")
public class OneController extends BaseController{

	@Autowired
	private IOneService oneService;

	@RequestMapping("find")
	public void select() {
		System.out.println(this.jsonSuccess(oneService.select()));
	}
}
