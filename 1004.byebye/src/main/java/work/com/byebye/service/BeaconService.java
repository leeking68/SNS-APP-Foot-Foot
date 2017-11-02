package work.com.byebye.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import work.com.byebye.dao.BeaconDao;
import work.com.byebye.dto.BeaconDto;

@Service
public class BeaconService {
	private BeaconDao dao;
	@Autowired
	public void setDao(BeaconDao dao) {
		this.dao = dao;
	}

	public BeaconService() {}

	public List<BeaconDto> getBeaconList() {
		return dao.getBeaconList();
	}
	
	public BeaconDto getBeacon(String BId) {
		return dao.getBeacon(BId);
	}

	public List<BeaconDto> getBeaconResult(ArrayList<String> macList) {
		return dao.getBeaconResult(macList);
	}
}



