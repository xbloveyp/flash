package com.flash_editor.service;

import com.flash_editor.domain.FollowPost;
import com.flash_editor.domain.FollowPostExample;
import com.flash_editor.mapper.FollowPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/3/25.
 */
@Service
public class FollowPostService {
    @Autowired
    private FollowPostMapper followPostMapper;

    public List<FollowPost> findFollowPostsByPid(int pid){
        FollowPostExample followPostExample = new FollowPostExample();
        followPostExample.or().andPidEqualTo(pid);
        return followPostMapper.selectByExampleWithBLOBs(followPostExample);
    }

    public void addFollowPost(FollowPost followPost){
        followPostMapper.insert(followPost);
    }

}
