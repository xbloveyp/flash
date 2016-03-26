package com.flash_editor.mapper;

import com.flash_editor.domain.FollowPost;
import com.flash_editor.domain.FollowPostExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FollowPostMapper {
    int countByExample(FollowPostExample example);

    int deleteByExample(FollowPostExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FollowPost record);

    int insertSelective(FollowPost record);

    List<FollowPost> selectByExampleWithBLOBs(FollowPostExample example);

    List<FollowPost> selectByExample(FollowPostExample example);

    FollowPost selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FollowPost record, @Param("example") FollowPostExample example);

    int updateByExampleWithBLOBs(@Param("record") FollowPost record, @Param("example") FollowPostExample example);

    int updateByExample(@Param("record") FollowPost record, @Param("example") FollowPostExample example);

    int updateByPrimaryKeySelective(FollowPost record);

    int updateByPrimaryKeyWithBLOBs(FollowPost record);

    int updateByPrimaryKey(FollowPost record);
}