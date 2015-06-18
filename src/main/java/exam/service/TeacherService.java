package exam.service;

import exam.model.role.Teacher;
import exam.service.base.BaseService;

public interface TeacherService extends BaseService<Teacher> {

	/**
	 * 更新老师姓名
	 */
	public void updateName(String id, String name);
	
	/**
	 * 更改密码
	 * @param password 未经过MD5加密的密码
	 */
	public void updatePassword(String id, String password);
	
}
