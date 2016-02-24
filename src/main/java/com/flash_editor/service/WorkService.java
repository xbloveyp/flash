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

    public void addContent(FlashProject flashProject){
        flashProjectMapper.insert(flashProject);
    }

    public FlashProject findByUid(int uid){
        FlashProjectExample flashProjectExample = new FlashProjectExample();
        flashProjectExample.createCriteria().andUidEqualTo(uid);
        List<FlashProject> flashContentList = flashProjectMapper.selectByExample(flashProjectExample);
        if (CollectionUtils.isNotEmpty(flashContentList)){
            return flashContentList.get(0);
        }
        else {
            return null;
        }
    }
}
