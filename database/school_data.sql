BEGIN;

CREATE TABLE IF NOT EXISTS school_data (
    udise_code TEXT,
    year TEXT,
    schoolname TEXT,
    state TEXT,
    district TEXT,
    block TEXT,
    urban TEXT,
    cluster TEXT,
    ward TEXT,
    mohalla TEXT,
    pincode TEXT,
    panchayat TEXT,
    city TEXT,
    municipality TEXT,
    assembly TEXT,
    parl_const TEXT,
    category TEXT,
    management TEXT,
    type TEXT,
    low_high TEXT,
    preprim TEXT,
    medium1 TEXT,
    medium2 TEXT,
    medium3 TEXT,
    medium4 TEXT,
    year_est TEXT,
    recog_pri TEXT,
    recog_upr_pri TEXT,
    recog_sec TEXT,
    recog_highsec TEXT,
    shift TEXT,
    building_stat TEXT,
    boundary TEXT,
    no_blocks TEXT,
    pucca_blocks TEXT,
    specialschool TEXT,
    ramps TEXT,
    handrails TEXT,
    aganwadi TEXT,
    aganwadi_b TEXT,
    aganwadi_g TEXT,
    aganwadi_worker TEXT,
    residential TEXT,
    resid_type TEXT,
    minorityschool TEXT,
    road TEXT,
    toilet_tot_b TEXT,
    toilet_tot_g TEXT,
    toilet_func_b TEXT,
    toilet_func_g TEXT,
    toilet_cwsn_b TEXT,
    toilet_cwsn_g TEXT,
    urinal_b TEXT,
    urinal_g TEXT,
    handwash TEXT,
    handwash_meal TEXT,
    class_good TEXT,
    class_minor TEXT,
    class_major TEXT,
    other_room TEXT,
    library TEXT,
    room_hm TEXT,
    drinking TEXT,
    drinking_func TEXT,
    rainwater TEXT,
    playground TEXT,
    furniture TEXT,
    electric TEXT,
    solar TEXT,
    medical TEXT,
    ict TEXT,
    laptop TEXT,
    projector TEXT,
    internet TEXT,
    tablet TEXT,
    dth TEXT,
    desktop TEXT,
    printer TEXT,
    digiboard TEXT,
    rte_pre_b TEXT,
    rte_pre_g TEXT,
    rte_1_b	TEXT,
    rte_1_g	TEXT,
    rte_2_b	TEXT,
    rte_2_g	TEXT,
    rte_3_b	TEXT,
    rte_3_g	TEXT,
    rte_4_b	TEXT,
    rte_4_g	TEXT,
    rte_5_b	TEXT,
    rte_5_g	TEXT,
    rte_6_b	TEXT,
    rte_6_g	TEXT,
    rte_7_b	TEXT,
    rte_7_g	TEXT,
    rte_8_b	TEXT,
    rte_8_g	TEXT,
    ews_pre_b TEXT,
    ews_pre_g TEXT,
    ews_1_b	TEXT,
    ews_1_g	TEXT,
    ews_2_b	TEXT,
    ews_2_g	TEXT,
    ews_3_b	TEXT,
    ews_3_g	TEXT,
    ews_4_b	TEXT,
    ews_4_g	TEXT,
    ews_5_b	TEXT,
    ews_5_g	TEXT,
    ews_6_b	TEXT,
    ews_6_g	TEXT,
    ews_7_b	TEXT,
    ews_7_g	TEXT,
    ews_8_b	TEXT,
    ews_8_g	TEXT,
    ews_9_b	TEXT,
    ews_9_g	TEXT,
    ews_10_b TEXT,
    ews_10_g TEXT,
    ews_11_b TEXT,
    ews_11_g TEXT,
    ews_12_b TEXT,
    ews_12_g TEXT,
    tea_reg	TEXT,
    tea_part TEXT,
    tea_contract TEXT,
    tea_male TEXT,
    tea_fem TEXT,
    tea_trans TEXT,
    qual_below TEXT,
    qual_grad TEXT,
    tea_post TEXT,
    pqual_dipl TEXT,
    tqual_bed TEXT,
    tqual_other TEXT,
    tqual_special TEXT,
    tqual_bach TEXT,
    tqual_med TEXT,
    tqual_none TEXT,
    tqual_pursue TEXT,
    gen_pre_pr_b TEXT, gen_pre_pr_g TEXT,
    gen_1_b TEXT, gen_1_g TEXT,
    gen_2_b TEXT, gen_2_g TEXT,
    gen_3_b TEXT, gen_3_g TEXT,
    gen_4_b TEXT, gen_4_g TEXT,
    gen_5_b TEXT, gen_5_g TEXT,
    gen_6_b TEXT, gen_6_g TEXT,
    gen_7_b TEXT, gen_7_g TEXT,
    gen_8_b TEXT, gen_8_g TEXT,
    gen_9_b TEXT, gen_9_g TEXT,
    gen_10_b TEXT, gen_10_g TEXT,
    gen_11_b TEXT, gen_11_g TEXT,
    gen_12_b TEXT, gen_12_g TEXT,
    sc_pre_pr_b TEXT, sc_pre_pr_g TEXT,
    sc_1_b TEXT, sc_1_g TEXT,
    sc_2_b TEXT, sc_2_g TEXT,
    sc_3_b TEXT, sc_3_g TEXT,
    sc_4_b TEXT, sc_4_g TEXT,
    sc_5_b TEXT, sc_5_g TEXT,
    sc_6_b TEXT, sc_6_g TEXT,
    sc_7_b TEXT, sc_7_g TEXT,
    sc_8_b TEXT, sc_8_g TEXT,
    sc_9_b TEXT, sc_9_g TEXT,
    sc_10_b TEXT, sc_10_g TEXT,
    sc_11_b TEXT, sc_11_g TEXT,
    sc_12_b TEXT, sc_12_g TEXT,
    st_pre_pr_b TEXT, st_pre_pr_g TEXT,
    st_1_b TEXT, st_1_g TEXT,
    st_2_b TEXT, st_2_g TEXT,
    st_3_b TEXT, st_3_g TEXT,
    st_4_b TEXT, st_4_g TEXT,
    st_5_b TEXT, st_5_g TEXT,
    st_6_b TEXT, st_6_g TEXT,
    st_7_b TEXT, st_7_g TEXT,
    st_8_b TEXT, st_8_g TEXT,
    st_9_b TEXT, st_9_g TEXT,
    st_10_b TEXT, st_10_g TEXT,
    st_11_b TEXT, st_11_g TEXT,
    st_12_b TEXT, st_12_g TEXT,
    obc_pre_pr_b TEXT, obc_pre_pr_g TEXT,
    obc_1_b TEXT, obc_1_g TEXT,
    obc_2_b TEXT, obc_2_g TEXT,
    obc_3_b TEXT, obc_3_g TEXT,
    obc_4_b TEXT, obc_4_g TEXT,
    obc_5_b TEXT, obc_5_g TEXT,
    obc_6_b TEXT, obc_6_g TEXT,
    obc_7_b TEXT, obc_7_g TEXT,
    obc_8_b TEXT, obc_8_g TEXT,
    obc_9_b TEXT, obc_9_g TEXT,
    obc_10_b TEXT, obc_10_g TEXT,
    obc_11_b TEXT, obc_11_g TEXT,
    obc_12_b TEXT, obc_12_g TEXT,
    musl_pre_pr_b TEXT, musl_pre_pr_g TEXT,
    musl_1_b TEXT, musl_1_g TEXT,
    musl_2_b TEXT, musl_2_g TEXT,
    musl_3_b TEXT, musl_3_g TEXT,
    musl_4_b TEXT, musl_4_g TEXT,
    musl_5_b TEXT, musl_5_g TEXT,
    musl_6_b TEXT, musl_6_g TEXT,
    musl_7_b TEXT, musl_7_g TEXT,
    musl_8_b TEXT, musl_8_g TEXT,
    musl_9_b TEXT, musl_9_g TEXT,
    musl_10_b TEXT, musl_10_g TEXT,
    musl_11_b TEXT, musl_11_g TEXT,
    musl_12_b TEXT, musl_12_g TEXT,
    chris_pre_pr_b TEXT, chris_pre_pr_g TEXT,
    chris_1_b TEXT, chris_1_g TEXT,
    chris_2_b TEXT, chris_2_g TEXT,
    chris_3_b TEXT, chris_3_g TEXT,
    chris_4_b TEXT, chris_4_g TEXT,
    chris_5_b TEXT, chris_5_g TEXT,
    chris_6_b TEXT, chris_6_g TEXT,
    chris_7_b TEXT, chris_7_g TEXT,
    chris_8_b TEXT, chris_8_g TEXT,
    chris_9_b TEXT, chris_9_g TEXT,
    chris_10_b TEXT, chris_10_g TEXT,
    chris_11_b TEXT, chris_11_g TEXT,
    chris_12_b TEXT, chris_12_g TEXT,
    sikh_pre_pr_b TEXT, sikh_pre_pr_g TEXT,
    sikh_1_b TEXT, sikh_1_g TEXT,
    sikh_2_b TEXT, sikh_2_g TEXT,
    sikh_3_b TEXT, sikh_3_g TEXT,
    sikh_4_b TEXT, sikh_4_g TEXT,
    sikh_5_b TEXT, sikh_5_g TEXT,
    sikh_6_b TEXT, sikh_6_g TEXT,
    sikh_7_b TEXT, sikh_7_g TEXT,
    sikh_8_b TEXT, sikh_8_g TEXT,
    sikh_9_b TEXT, sikh_9_g TEXT,
    sikh_10_b TEXT, sikh_10_g TEXT,
    sikh_11_b TEXT, sikh_11_g TEXT,
    sikh_12_b TEXT, sikh_12_g TEXT,
    budh_pre_pr_b TEXT, budh_pre_pr_g TEXT,
    budh_1_b TEXT, budh_1_g TEXT,
    budh_2_b TEXT, budh_2_g TEXT,
    budh_3_b TEXT, budh_3_g TEXT,
    budh_4_b TEXT, budh_4_g TEXT,
    budh_5_b TEXT, budh_5_g TEXT,
    budh_6_b TEXT, budh_6_g TEXT,
    budh_7_b TEXT, budh_7_g TEXT,
    budh_8_b TEXT, budh_8_g TEXT,
    budh_9_b TEXT, budh_9_g TEXT,
    budh_10_b TEXT, budh_10_g TEXT,
    budh_11_b TEXT, budh_11_g TEXT,
    budh_12_b TEXT, budh_12_g TEXT,
    parsi_pre_pr_b TEXT, parsi_pre_pr_g TEXT,
    parsi_1_b TEXT, parsi_1_g TEXT,
    parsi_2_b TEXT, parsi_2_g TEXT,
    parsi_3_b TEXT, parsi_3_g TEXT,
    parsi_4_b TEXT, parsi_4_g TEXT,
    parsi_5_b TEXT, parsi_5_g TEXT,
    parsi_6_b TEXT, parsi_6_g TEXT,
    parsi_7_b TEXT, parsi_7_g TEXT,
    parsi_8_b TEXT, parsi_8_g TEXT,
    parsi_9_b TEXT, parsi_9_g TEXT,
    parsi_10_b TEXT, parsi_10_g TEXT,
    parsi_11_b TEXT, parsi_11_g TEXT,
    parsi_12_b TEXT, parsi_12_g TEXT,
    jain_pre_pr_b TEXT, jain_pre_pr_g TEXT,
    jain_1_b TEXT, jain_1_g TEXT,
    jain_2_b TEXT, jain_2_g TEXT,
    jain_3_b TEXT, jain_3_g TEXT,
    jain_4_b TEXT, jain_4_g TEXT,
    jain_5_b TEXT, jain_5_g TEXT,
    jain_6_b TEXT, jain_6_g TEXT,
    jain_7_b TEXT, jain_7_g TEXT,
    jain_8_b TEXT, jain_8_g TEXT,
    jain_9_b TEXT, jain_9_g TEXT,
    jain_10_b TEXT, jain_10_g TEXT,
    jain_11_b TEXT, jain_11_g TEXT,
    jain_12_b TEXT, jain_12_g TEXT,
    other_pre_pr_b TEXT, other_pre_pr_g TEXT,
    other_1_b TEXT, other_1_g TEXT,
    other_2_b TEXT, other_2_g TEXT,
    other_3_b TEXT, other_3_g TEXT,
    other_4_b TEXT, other_4_g TEXT,
    other_5_b TEXT, other_5_g TEXT,
    other_6_b TEXT, other_6_g TEXT,
    other_7_b TEXT, other_7_g TEXT,
    other_8_b TEXT, other_8_g TEXT,
    other_9_b TEXT, other_9_g TEXT,
    other_10_b TEXT, other_10_g TEXT,
    other_11_b TEXT, other_11_g TEXT,
    other_12_b TEXT, other_12_g TEXT,
    bpl_pre_pr_b TEXT, bpl_pre_pr_g TEXT,
    bpl_1_b TEXT, bpl_1_g TEXT,
    bpl_2_b TEXT, bpl_2_g TEXT,
    bpl_3_b TEXT, bpl_3_g TEXT,
    bpl_4_b TEXT, bpl_4_g TEXT,
    bpl_5_b TEXT, bpl_5_g TEXT,
    bpl_6_b TEXT, bpl_6_g TEXT,
    bpl_7_b TEXT, bpl_7_g TEXT,
    bpl_8_b TEXT, bpl_8_g TEXT,
    bpl_9_b TEXT, bpl_9_g TEXT,
    bpl_10_b TEXT, bpl_10_g TEXT,
    bpl_11_b TEXT, bpl_11_g TEXT,
    bpl_12_b TEXT, bpl_12_g TEXT,
    cwsn_pr_b TEXT, cwsn_pre_pr_g TEXT,
    cwsn_1_b TEXT, cwsn_1_g TEXT,
    cwsn_2_b TEXT, cwsn_2_g TEXT,
    cwsn_3_b TEXT, cwsn_3_g TEXT,
    cwsn_4_b TEXT, cwsn_4_g TEXT,
    cwsn_5_b TEXT, cwsn_5_g TEXT,
    cwsn_6_b TEXT, cwsn_6_g TEXT,
    cwsn_7_b TEXT, cwsn_7_g TEXT,
    cwsn_8_b TEXT, cwsn_8_g TEXT,
    cwsn_9_b TEXT, cwsn_9_g TEXT,
    cwsn_10_b TEXT, cwsn_10_g TEXT,
    cwsn_11_b TEXT, cwsn_11_g TEXT,
    cwsn_12_b TEXT, cwsn_12_g TEXT


);

COMMIT;
