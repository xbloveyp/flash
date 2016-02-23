package com.flash_editor.service;

import com.flash_editor.domain.FlashContent;
import com.flash_editor.domain.FlashContentExample;
import com.flash_editor.mapper.FlashContentMapper;
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
    private FlashContentMapper flashContentMapper;

    public void addContent(FlashContent flashContent){
        flashContentMapper.insert(flashContent);
    }

    public FlashContent findByUid(int uid){
        FlashContentExample flashContentExample = new FlashContentExample();
        flashContentExample.createCriteria().andUidEqualTo(uid);
        List<FlashContent> flashContentList = flashContentMapper.selectByExample(flashContentExample);
        if (CollectionUtils.isNotEmpty(flashContentList)){
            return flashContentList.get(0);
        }
        else {
            return null;
        }
    }
}
