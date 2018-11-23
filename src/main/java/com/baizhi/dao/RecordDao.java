package com.baizhi.dao;

import java.util.List;

import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;


public interface RecordDao {
	public void insert(Record record);
	
	public Record selectOne();
	
	public List<RecordDTO> selectAll(int id);
	
	public void delete(int auction_id);
	
}
