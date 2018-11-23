package com.baizhi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.dao.RecordDao;
import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;
import com.baizhi.service.RecordService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RecordServiceImpl implements RecordService {
	
	@Autowired
	private RecordDao recordDao;
	
	public void setRecordDao(RecordDao recordDao) {
		this.recordDao = recordDao;
	}

	@Override
	public void insert(Record record) {
		// TODO Auto-generated method stub
		recordDao.insert(record);
	}

	@Override
	public Record selectOne() {
		// TODO Auto-generated method stub
		Record rec = recordDao.selectOne();
		return rec;
	}

	@Override
	public List<RecordDTO> selectAll(int id) {
		// TODO Auto-generated method stub
		List<RecordDTO> list = recordDao.selectAll(id);
		return list;
	}

	@Override
	public void delete(int auction_id) {
		// TODO Auto-generated method stub
		recordDao.delete(auction_id);
	}
	
	
}
