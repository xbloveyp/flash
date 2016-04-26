package com.flash_editor.service;

import com.flash_editor.domain.PostPraise;
import com.flash_editor.domain.PostPraiseExample;
import com.flash_editor.mapper.PostPraiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2016/4/26.
 */
@Component
public class PostPriaseService {
    @Autowired
    private PostPraiseMapper postPraiseMapper;

    public void insert(int postId,int userId){
        PostPraise postPraise = new PostPraise();
        postPraise.setUserId(userId);
        postPraise.setPostId(postId);
        postPraiseMapper.insert(postPraise);
    }

    public List<PostPraise> selectByPostId(int postId){
        PostPraiseExample postPraiseExample = new PostPraiseExample();
        postPraiseExample.createCriteria().andPostIdEqualTo(postId);
        List<PostPraise> postPraises =  postPraiseMapper.selectByExample(postPraiseExample);
        return  postPraises;
    }
}
