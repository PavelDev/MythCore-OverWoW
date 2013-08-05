/*
 * Copyright (C) 2008 - 2011 Trinity <http://www.trinitycore.org/>
 *
 * Copyright (C) 2010 - 2011 Myth Project <http://bitbucket.org/sun/myth-core/>
 *
 * Myth Project's source is based on the Trinity Project source, you can find the
 * link to that easily in Trinity Copyrights. Myth Project is a private community.
 * To get access, you either have to donate or pass a developer test.
 * You can't share Myth Project's sources! Only for personal use.
 */

#ifndef SC_ACDATA_H
#define SC_ACDATA_H

#include "AnticheatMgr.h"

#define MAX_REPORT_TYPES 6

class AnticheatData
{
public:
    AnticheatData();
    ~AnticheatData();

    void SetLastOpcode(uint32 opcode);
    uint32 GetLastOpcode() const;

    const MovementInfo& GetLastMovementInfo() const;
    void SetLastMovementInfo(MovementInfo& moveInfo);

    void SetPosition(float x, float y, float z, float o);

    /*
    bool GetDisableACCheck() const;
    void SetDisableACCheck(bool check);

    uint32 GetDisableACTimer() const;
    void SetDisableACTimer(uint32 timer);*/

    uint32 GetTotalReports() const;
    void SetTotalReports(uint32 _totalReports);

    uint32 GetTypeReports(uint32 type) const;
    void SetTypeReports(uint32 type, uint32 amount);

    float GetAverage() const;
    void SetAverage(float _average);

    uint32 GetCreationTime() const;
    void SetCreationTime(uint32 creationTime);

    void SetTempReports(uint32 amount, uint8 type);
    uint32 GetTempReports(uint8 type);

    void SetTempReportsTimer(uint32 time, uint8 type);
    uint32 GetTempReportsTimer(uint8 type);
private:
    uint32 lastOpcode;
    MovementInfo lastMovementInfo;
    //bool disableACCheck;
    //uint32 disableACCheckTimer;
    uint32 totalReports;
    uint32 typeReports[MAX_REPORT_TYPES];
    float average;
    uint32 creationTime;
    uint32 tempReports[MAX_REPORT_TYPES];
    uint32 tempReportsTimer[MAX_REPORT_TYPES];
};

#endif