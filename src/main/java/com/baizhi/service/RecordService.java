package com.baizhi.service;

import java.util.List;

import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;

public interface RecordService {
	
	public void insert(Record record);
	
	public Record selectOne();
	
	public List<RecordDTO> selectAll(int id);
	
	public void delete(int auction_id);
	
}
