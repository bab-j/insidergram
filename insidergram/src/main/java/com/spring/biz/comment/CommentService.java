package com.spring.biz.comment;

import java.util.List;

public interface CommentService {
	List<CommentVO> getCommList(int f_idx);
	int writeComm(String comm, String u_id, int f_idx);
}
