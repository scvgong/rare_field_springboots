package com.yojulab.study_springboot.security;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class PrincipalUser implements UserDetails {

    private Map userInfo;

    public String getMemberName() {
        return (String) userInfo.get("user_ID");
    }

    public PrincipalUser(Map userInfo) {
        this.userInfo = userInfo;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        // 권한들
        Collection<GrantedAuthority> collections = new ArrayList<>();
        List<Map<String, Object>> resultList = (List) userInfo.get("resultList");
        for(Map item: resultList){
            collections.add(new SimpleGrantedAuthority((String) item.get("UNIQUE_ID")));
        }
        return collections;
    }

    @Override
    public String getPassword() {
        // password
        return (String) userInfo.get("user_pswd");
    }

    @Override
    public String getUsername() {
        // ID
        return (String) userInfo.get("user_ID");
    }

    @Override
    public boolean isAccountNonExpired() {
        // 계정 만료 여부
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // 계정 잠길 여부
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // 비밀번호 변경 기간 만료
        return true;
    }

    @Override
    public boolean isEnabled() {
        // 휴먼 계정 여부
        return true;
    }

}