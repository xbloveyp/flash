package com.flash_editor.service;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.FlashProjectExample;
import com.flash_editor.domain.FlashProjectWithBLOBs;
import com.flash_editor.mapper.FlashProjectMapper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/2/23.
 */
@Service
public class WorkService {
    @Autowired
    private FlashProjectMapper flashProjectMapper;

    public void saveContent(FlashProjectWithBLOBs flashProject){
        FlashProjectWithBLOBs flashProjectOld = findById(flashProject.getId());
        if (flashProjectOld==null) {
            flashProjectOld.setAddTime(new Date());
            flashProjectMapper.insert(flashProject);
        }else {
            flashProject.setUpdateTime(new Date());
            flashProjectMapper.updateByPrimaryKeySelective(flashProject);
        }
    }

    public List<FlashProjectWithBLOBs> findByUid(int uid){
        FlashProjectExample flashProjectExample = new FlashProjectExample();
        flashProjectExample.createCriteria().andUidEqualTo(uid).andStatusEqualTo(0);
        flashProjectExample.setOrderByClause("add_time desc");
        List<FlashProjectWithBLOBs> flashProjectList = flashProjectMapper.selectByExampleWithBLOBs(flashProjectExample);
        return flashProjectList;
    }

    public FlashProjectWithBLOBs findById(int id){
        FlashProjectExample flashProjectExample = new FlashProjectExample();
        flashProjectExample.createCriteria().andIdEqualTo(id).andStatusEqualTo(0);
        List<FlashProjectWithBLOBs> flashProjectList = flashProjectMapper.selectByExampleWithBLOBs(flashProjectExample);
        if (CollectionUtils.isNotEmpty(flashProjectList)){
            return flashProjectList.get(0);
        }
        else {
            return null;
        }
    }

    public void addProject(FlashProjectWithBLOBs flashProject){
        flashProject.setAddTime(new Date());
        flashProject.setUpdateTime(new Date());
        flashProject.setStatus(0);
        flashProjectMapper.insert(flashProject);
    }

    public void deleteProject(int id){
        FlashProjectWithBLOBs flashProject = new FlashProjectWithBLOBs();
        flashProject.setId(id);
        flashProject.setStatus(1);
        flashProjectMapper.updateByPrimaryKeySelective(flashProject);
    }

    public void updateProject(FlashProjectWithBLOBs flashProject){
        flashProjectMapper.updateByPrimaryKeySelective(flashProject);
    }
}
