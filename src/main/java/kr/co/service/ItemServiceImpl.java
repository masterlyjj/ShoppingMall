package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CategoryVO;
import kr.co.domain.ItemVO;
import kr.co.repository.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Inject
	private ItemDAO iDao;
	


	@Override
	public void insert(ItemVO vo) {
		iDao.insert(vo);
	}

}
