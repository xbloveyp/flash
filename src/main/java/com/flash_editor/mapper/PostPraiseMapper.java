package com.flash_editor.mapper;

import com.flash_editor.domain.PostPraise;
import com.flash_editor.domain.PostPraiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PostPraiseMapper {
    int countByExample(PostPraiseExample example);

    int deleteByExample(PostPraiseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PostPraise record);

    int insertSelective(PostPraise record);

    List<PostPraise> selectByExample(PostPraiseExample example);

    PostPraise selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PostPraise record, @Param("example") PostPraiseExample example);

    int updateByExample(@Param("record") PostPraise record, @Param("example") PostPraiseExample example);

    int updateByPrimaryKeySelective(PostPraise record);

    int updateByPrimaryKey(PostPraise record);
}