package com.boxads.common.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.MessageVO;


@Mapper
public interface MessageMapper {

	int selectMessageCnt(MessageVO mvo) throws Exception;

	List<MessageVO> selectMessageByWriter(MessageVO mvo) throws Exception;

	MessageVO selectMemberForMesg(MessageVO mvo) throws Exception;

	void insertMessage(MessageVO mvo) throws Exception;

	List<MessageVO> selectMessageList(MessageVO mvo) throws Exception;

	int selectMessageByWriterCnt(MessageVO mvo) throws Exception;

	List<MessageVO> selectInitMessage(MessageVO mvo) throws Exception;

	void updateMessage(MessageVO mvo) throws Exception;

	int deleteMessage(HashMap<String, Object> param) throws Exception;

	void deleteMessageFile(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> selectOrderMessageInfo(HashMap<String, Object> param) throws Exception;


		
}
