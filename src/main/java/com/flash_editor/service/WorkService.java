package com.flash_editor.service;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.FlashProjectExample;
import com.flash_editor.mapper.FlashProjectMapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/2/23.
 */
@Service
public class WorkService {
    @Autowired
    private FlashProjectMapper flashProjectMapper;

    public void saveContent(FlashProject flashProject){
        FlashProject flashProjectOld = findByUid(flashProject.getUid());
        if (flashProjectOld==null) {
            flashProjectMapper.insert(flashProject);
        }else {
            flashProjectMapper.updateByPrimaryKeySelective(flashProject);
        }
    }

    public FlashProject findByUid(int uid){
        FlashProjectExample flashProjectExample = new FlashProjectExample();
        flashProjectExample.createCriteria().andUidEqualTo(uid);
        List<FlashProject> flashProjectList = flashProjectMapper.selectByExampleWithBLOBs(flashProjectExample);
        if (CollectionUtils.isNotEmpty(flashProjectList)){
            return flashProjectList.get(0);
        }
        else {
            return null;
        }
    }
}
