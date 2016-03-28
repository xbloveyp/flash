package com.flash_editor.service;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.PostExample;
import com.flash_editor.mapper.PostMapper;
import com.flash_editor.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
	private PostMapper postMapper;

    public int countEssencePost(){
        PostExample example = new PostExample();
        example.createCriteria().andTypeEqualTo(Const.TYPE_ESSENCE);
        return postMapper.countByExample(example);
    }

	public List<Post> findAllEssencePosts(int pageNum) {
        PostExample example = new PostExample();
        example.createCriteria().andTypeEqualTo(Const.TYPE_ESSENCE);
        example.setOrderByClause("update_time desc");
        example.setStart((pageNum - 1) * Const.PAGEITEMNUM);
        example.setLimit(Const.PAGEITEMNUM);
		return postMapper.selectByExample(example);
	}

    public int countNewestPost(){
        PostExample example = new PostExample();
        example.createCriteria().andTypeNotEqualTo(Const.TYPE_INVALID);
        return postMapper.countByExample(example);
    }

    public List<Post> findAllNewestPosts(int pageNum) {
        PostExample example = new PostExample();
        example.createCriteria().andTypeNotEqualTo(Const.TYPE_INVALID);
        example.setOrderByClause("update_time desc");
        example.setStart((pageNum - 1) * Const.PAGEITEMNUM);
        example.setLimit(Const.PAGEITEMNUM);
        return postMapper.selectByExample(example);
    }

    public int countMyPost(int uid){
        PostExample example = new PostExample();
        example.createCriteria().andUidEqualTo(uid);
        return postMapper.countByExample(example);
    }

    public List<Post> findAllMyPosts(int uid,int pageNum) {
        PostExample example = new PostExample();
        example.createCriteria().andUidEqualTo(uid);
        example.setOrderByClause("update_time desc");
        example.setStart((pageNum - 1) * Const.PAGEITEMNUM);
        example.setLimit(Const.PAGEITEMNUM);
        return postMapper.selectByExample(example);
    }

    public void addPost(Post post) {
         post.setType(Const.TYPE_COMMON);
         post.setPraise(0);
         postMapper.insert(post);
    }

    public Post findPostById(int id) {
        return postMapper.selectByPrimaryKey(id);
    }

    public void updata(Post post) {
        postMapper.updateByPrimaryKeySelective(post);
    }
}
