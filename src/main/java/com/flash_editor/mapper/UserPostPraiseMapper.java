package com.flash_editor.mapper;

import com.flash_editor.domain.UserPostPraise;
import com.flash_editor.domain.UserPostPraiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserPostPraiseMapper {
    int countByExample(UserPostPraiseExample example);

    int deleteByExample(UserPostPraiseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserPostPraise record);

    int insertSelective(UserPostPraise record);

    List<UserPostPraise> selectByExample(UserPostPraiseExample example);

    UserPostPraise selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserPostPraise record, @Param("example") UserPostPraiseExample example);

    int updateByExample(@Param("record") UserPostPraise record, @Param("example") UserPostPraiseExample example);

    int updateByPrimaryKeySelective(UserPostPraise record);

    int updateByPrimaryKey(UserPostPraise record);
}