.class public final Ldp1;
.super Laa2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public m:Ljava/lang/String;

.field public n:Ljava/util/HashSet;

.field public o:Lda;

.field public p:Ljava/lang/Long;

.field public q:Ljava/lang/Long;


# virtual methods
.method public final o()V
    .locals 0

    .line 1
    return-void
.end method

.method public final p(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;Z)Ljava/util/ArrayList;
    .locals 36

    move-object/from16 v1, p0

    .line 1
    const-string v8, "current_results"

    iget-object v0, v1, Let;->j:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ly02;

    invoke-static/range {p1 .. p1}, Lbh;->e(Ljava/lang/String;)V

    .line 2
    invoke-static/range {p2 .. p2}, Lbh;->h(Ljava/lang/Object;)V

    .line 3
    invoke-static/range {p3 .. p3}, Lbh;->h(Ljava/lang/Object;)V

    move-object/from16 v0, p1

    iput-object v0, v1, Ldp1;->m:Ljava/lang/String;

    new-instance v0, Ljava/util/HashSet;

    .line 4
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 5
    new-instance v0, Lda;

    .line 6
    invoke-direct {v0}, Lu71;-><init>()V

    .line 7
    iput-object v0, v1, Ldp1;->o:Lda;

    move-object/from16 v0, p4

    iput-object v0, v1, Ldp1;->p:Ljava/lang/Long;

    move-object/from16 v0, p5

    iput-object v0, v1, Ldp1;->q:Ljava/lang/Long;

    .line 8
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v10, 0x0

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj02;

    .line 9
    invoke-virtual {v2}, Lj02;->w()Ljava/lang/String;

    move-result-object v2

    const-string v3, "_s"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v10

    .line 10
    :goto_0
    invoke-static {}, Lds1;->a()V

    .line 11
    iget-object v0, v9, Ly02;->m:Lmt1;

    .line 12
    iget-object v3, v1, Ldp1;->m:Ljava/lang/String;

    .line 13
    sget-object v4, Lxx1;->F0:Lwx1;

    .line 14
    invoke-virtual {v0, v3, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v12

    .line 15
    invoke-static {}, Lds1;->a()V

    .line 16
    iget-object v0, v9, Ly02;->m:Lmt1;

    .line 17
    iget-object v3, v1, Ldp1;->m:Ljava/lang/String;

    sget-object v4, Lxx1;->E0:Lwx1;

    .line 18
    invoke-virtual {v0, v3, v4}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    move-result v13

    const-string v14, "events"

    iget-object v15, v1, Ls92;->k:Lsa2;

    if-eqz v2, :cond_2

    .line 19
    invoke-virtual {v15}, Lsa2;->g0()Ldu1;

    move-result-object v3

    iget-object v4, v1, Ldp1;->m:Ljava/lang/String;

    .line 20
    invoke-virtual {v3}, Laa2;->m()V

    .line 21
    invoke-virtual {v3}, Let;->l()V

    .line 22
    invoke-static {v4}, Lbh;->e(Ljava/lang/String;)V

    new-instance v0, Landroid/content/ContentValues;

    .line 23
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "current_session_count"

    .line 24
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 25
    :try_start_0
    invoke-virtual {v3}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v6, "app_id = ?"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v7

    .line 26
    invoke-virtual {v5, v14, v0, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 27
    iget-object v3, v3, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 28
    invoke-virtual {v3}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 29
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 30
    invoke-static {v4}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v4

    const-string v5, "Error resetting session-scoped event counts. appId"

    .line 31
    invoke-virtual {v3, v5, v4, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    :cond_2
    :goto_1
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const-string v3, "Failed to merge filter. appId"

    const-string v4, "Database error querying filters. appId"

    const-string v5, "data"

    const-string v6, "audience_id"

    if-eqz v13, :cond_9

    if-eqz v12, :cond_9

    .line 33
    invoke-virtual {v15}, Lsa2;->g0()Ldu1;

    move-result-object v7

    iget-object v10, v7, Let;->j:Ljava/lang/Object;

    check-cast v10, Ly02;

    iget-object v11, v1, Ldp1;->m:Ljava/lang/String;

    .line 34
    invoke-static {v11}, Lbh;->e(Ljava/lang/String;)V

    move/from16 p4, v2

    new-instance v2, Lda;

    .line 35
    invoke-direct {v2}, Lu71;-><init>()V

    .line 36
    invoke-virtual {v7}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v17

    :try_start_1
    const-string v18, "event_filters"

    filled-new-array {v6, v5}, [Ljava/lang/String;

    move-result-object v19

    const-string v20, "app_id=?"

    filled-new-array {v11}, [Ljava/lang/String;

    move-result-object v21

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v22, 0x0

    .line 37
    invoke-virtual/range {v17 .. v24}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 38
    :try_start_2
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v17
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v17, :cond_6

    move-object/from16 p5, v5

    :goto_2
    const/4 v5, 0x1

    .line 39
    :try_start_3
    invoke-interface {v7, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 40
    :try_start_4
    invoke-static {}, Lmx1;->D()Llx1;

    move-result-object v5

    invoke-static {v5, v0}, Lva2;->W(Llp1;[B)Llp1;

    move-result-object v0

    check-cast v0, Llx1;

    invoke-virtual {v0}, Llp1;->e()Lnp1;

    move-result-object v0

    check-cast v0, Lmx1;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 41
    :try_start_5
    invoke-virtual {v0}, Lmx1;->x()Z

    move-result v5

    if-nez v5, :cond_3

    move-object/from16 v18, v7

    goto :goto_5

    :cond_3
    const/4 v5, 0x0

    .line 42
    invoke-interface {v7, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v17

    .line 43
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/List;
    :try_end_5
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-nez v17, :cond_4

    move-object/from16 v18, v7

    :try_start_6
    new-instance v7, Ljava/util/ArrayList;

    .line 44
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 45
    invoke-virtual {v2, v5, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    goto :goto_8

    :cond_4
    move-object/from16 v18, v7

    move-object/from16 v7, v17

    .line 46
    :goto_3
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object/from16 v18, v7

    goto :goto_7

    :catch_2
    move-exception v0

    :goto_4
    move-object/from16 v18, v7

    goto :goto_8

    :catch_3
    move-exception v0

    move-object/from16 v18, v7

    .line 47
    invoke-virtual {v10}, Ly02;->b()Lzy1;

    move-result-object v5

    .line 48
    iget-object v5, v5, Lzy1;->o:Lso;

    .line 49
    invoke-static {v11}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v7

    .line 50
    invoke-virtual {v5, v3, v7, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    :goto_5
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-nez v0, :cond_5

    .line 52
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    move-object v10, v2

    goto :goto_d

    :cond_5
    move-object/from16 v7, v18

    goto :goto_2

    :cond_6
    move-object/from16 p5, v5

    move-object/from16 v18, v7

    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    :cond_7
    :goto_6
    move-object v10, v0

    goto :goto_d

    :goto_7
    move-object/from16 v7, v18

    goto :goto_c

    :catch_4
    move-exception v0

    move-object/from16 p5, v5

    goto :goto_4

    :goto_8
    move-object/from16 v7, v18

    goto :goto_b

    :catchall_2
    move-exception v0

    goto :goto_9

    :catch_5
    move-exception v0

    move-object/from16 p5, v5

    goto :goto_a

    :goto_9
    const/4 v7, 0x0

    goto :goto_c

    :goto_a
    const/4 v7, 0x0

    .line 53
    :goto_b
    :try_start_7
    invoke-virtual {v10}, Ly02;->b()Lzy1;

    move-result-object v2

    .line 54
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 55
    invoke-static {v11}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v5

    .line 56
    invoke-virtual {v2, v4, v5, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    if-eqz v7, :cond_7

    .line 58
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_6

    :catchall_3
    move-exception v0

    :goto_c
    if-eqz v7, :cond_8

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 59
    :cond_8
    throw v0

    :cond_9
    move/from16 p4, v2

    move-object/from16 p5, v5

    goto :goto_6

    .line 60
    :goto_d
    invoke-virtual {v15}, Lsa2;->g0()Ldu1;

    move-result-object v0

    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    check-cast v2, Ly02;

    iget-object v5, v1, Ldp1;->m:Ljava/lang/String;

    .line 61
    invoke-virtual {v0}, Laa2;->m()V

    .line 62
    invoke-virtual {v0}, Let;->l()V

    .line 63
    invoke-static {v5}, Lbh;->e(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v17

    :try_start_8
    const-string v18, "audience_filter_values"

    filled-new-array {v6, v8}, [Ljava/lang/String;

    move-result-object v19

    const-string v20, "app_id=?"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v21

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v22, 0x0

    .line 65
    invoke-virtual/range {v17 .. v24}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7
    :try_end_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8 .. :try_end_8} :catch_c
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 66
    :try_start_9
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_a

    .line 67
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 68
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v11, v0

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    goto/16 :goto_16

    :catchall_4
    move-exception v0

    goto/16 :goto_5f

    :catch_6
    move-exception v0

    move-object/from16 v17, v2

    :goto_e
    move-object/from16 v19, v3

    :goto_f
    move-object/from16 v20, v4

    :goto_10
    move-object/from16 v21, v5

    goto/16 :goto_15

    .line 69
    :cond_a
    :try_start_a
    new-instance v11, Lda;

    .line 70
    invoke-direct {v11}, Lu71;-><init>()V
    :try_end_a
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_a .. :try_end_a} :catch_6
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    move-object/from16 v17, v2

    :goto_11
    const/4 v2, 0x0

    .line 71
    :try_start_b
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    const/4 v2, 0x1

    .line 72
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_b .. :try_end_b} :catch_7
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 73
    :try_start_c
    invoke-static {}, Lj12;->z()Lh12;

    move-result-object v2

    invoke-static {v2, v0}, Lva2;->W(Llp1;[B)Llp1;

    move-result-object v0

    check-cast v0, Lh12;

    invoke-virtual {v0}, Llp1;->e()Lnp1;

    move-result-object v0

    check-cast v0, Lj12;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 74
    :try_start_d
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v2, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v21, v5

    goto :goto_12

    :catch_7
    move-exception v0

    goto :goto_e

    :catch_8
    move-exception v0

    .line 75
    invoke-virtual/range {v17 .. v17}, Ly02;->b()Lzy1;

    move-result-object v2

    .line 76
    iget-object v2, v2, Lzy1;->o:Lso;
    :try_end_d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_d .. :try_end_d} :catch_7
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    move-object/from16 v19, v3

    .line 77
    :try_start_e
    const-string v3, "Failed to merge filter results. appId, audienceId, error"
    :try_end_e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_e .. :try_end_e} :catch_b
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    move-object/from16 v20, v4

    :try_start_f
    invoke-static {v5}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v4
    :try_end_f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f .. :try_end_f} :catch_a
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    move-object/from16 v21, v5

    .line 78
    :try_start_10
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 79
    invoke-virtual {v2, v3, v4, v5, v0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    :goto_12
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_10
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_10 .. :try_end_10} :catch_9
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    if-nez v0, :cond_b

    .line 81
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_16

    :cond_b
    move-object/from16 v3, v19

    move-object/from16 v4, v20

    move-object/from16 v5, v21

    goto :goto_11

    :catch_9
    move-exception v0

    goto :goto_15

    :catch_a
    move-exception v0

    goto :goto_10

    :catch_b
    move-exception v0

    goto :goto_f

    :catchall_5
    move-exception v0

    goto :goto_13

    :catch_c
    move-exception v0

    move-object/from16 v17, v2

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v21, v5

    goto :goto_14

    :goto_13
    const/4 v7, 0x0

    goto/16 :goto_5f

    :goto_14
    const/4 v7, 0x0

    .line 82
    :goto_15
    :try_start_11
    invoke-virtual/range {v17 .. v17}, Ly02;->b()Lzy1;

    move-result-object v2

    .line 83
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 84
    const-string v3, "Database error querying filter results. appId"

    invoke-static/range {v21 .. v21}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v4

    .line 85
    invoke-virtual {v2, v3, v4, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    if-eqz v7, :cond_c

    .line 87
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_c
    move-object v11, v0

    .line 88
    :goto_16
    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    move-object/from16 v10, v20

    move-object/from16 v20, v15

    move-object v15, v6

    :goto_17
    move-object/from16 v11, p5

    move-object/from16 v12, v19

    goto/16 :goto_31

    .line 89
    :cond_d
    new-instance v2, Ljava/util/HashSet;

    .line 90
    invoke-interface {v11}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    if-eqz p4, :cond_1c

    iget-object v3, v1, Ldp1;->m:Ljava/lang/String;

    .line 91
    invoke-virtual {v15}, Lsa2;->g0()Ldu1;

    move-result-object v4

    iget-object v5, v1, Ldp1;->m:Ljava/lang/String;

    .line 92
    invoke-virtual {v4}, Laa2;->m()V

    .line 93
    invoke-virtual {v4}, Let;->l()V

    .line 94
    invoke-static {v5}, Lbh;->e(Ljava/lang/String;)V

    new-instance v0, Lda;

    .line 95
    invoke-direct {v0}, Lu71;-><init>()V

    .line 96
    invoke-virtual {v4}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    move-object/from16 p4, v2

    :try_start_12
    const-string v2, "select audience_id, filter_id from event_filters where app_id = ? and session_scoped = 1 UNION select audience_id, filter_id from property_filters where app_id = ? and session_scoped = 1;"
    :try_end_12
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_12} :catch_f
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    move-object/from16 v17, v3

    :try_start_13
    filled-new-array {v5, v5}, [Ljava/lang/String;

    move-result-object v3

    .line 97
    invoke-virtual {v7, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_13
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_13 .. :try_end_13} :catch_e
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    .line 98
    :try_start_14
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_10

    :cond_e
    const/4 v3, 0x0

    .line 99
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 100
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_f

    new-instance v7, Ljava/util/ArrayList;

    .line 101
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 102
    invoke-virtual {v0, v3, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    const/4 v3, 0x1

    goto :goto_18

    :catchall_6
    move-exception v0

    goto :goto_1a

    :catch_d
    move-exception v0

    goto :goto_1d

    .line 103
    :goto_18
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 104
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3
    :try_end_14
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_14 .. :try_end_14} :catch_d
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    if-nez v3, :cond_e

    .line 106
    :goto_19
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_1e

    .line 107
    :cond_10
    :try_start_15
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_15
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_15 .. :try_end_15} :catch_d
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    goto :goto_19

    :goto_1a
    move-object v7, v2

    goto/16 :goto_25

    :catchall_7
    move-exception v0

    goto :goto_1b

    :catch_e
    move-exception v0

    goto :goto_1c

    :goto_1b
    const/4 v7, 0x0

    goto/16 :goto_25

    :catch_f
    move-exception v0

    move-object/from16 v17, v3

    :goto_1c
    const/4 v2, 0x0

    .line 108
    :goto_1d
    :try_start_16
    iget-object v3, v4, Let;->j:Ljava/lang/Object;

    check-cast v3, Ly02;

    .line 109
    invoke-virtual {v3}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 110
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 111
    const-string v4, "Database error querying scoped filters. appId"

    invoke-static {v5}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v5

    .line 112
    invoke-virtual {v3, v4, v5, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 113
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    if-eqz v2, :cond_11

    goto :goto_19

    .line 114
    :cond_11
    :goto_1e
    invoke-static/range {v17 .. v17}, Lbh;->e(Ljava/lang/String;)V

    .line 115
    new-instance v2, Lda;

    .line 116
    invoke-direct {v2}, Lu71;-><init>()V

    .line 117
    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    :cond_12
    move-object/from16 v18, v6

    move/from16 v24, v12

    goto/16 :goto_24

    .line 118
    :cond_13
    invoke-interface {v11}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_12

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    invoke-interface {v11, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj12;

    .line 120
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-eqz v7, :cond_14

    .line 121
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_15

    :cond_14
    move-object/from16 v17, v0

    move-object/from16 v21, v3

    move-object/from16 v18, v6

    move/from16 v24, v12

    goto/16 :goto_23

    :cond_15
    move-object/from16 v17, v0

    .line 122
    invoke-virtual {v15}, Lsa2;->j0()Lva2;

    move-result-object v0

    .line 123
    invoke-virtual {v5}, Lj12;->t()Ljava/util/List;

    move-result-object v18

    move-object/from16 v21, v3

    move-object/from16 v3, v18

    check-cast v3, Lxp1;

    invoke-virtual {v0, v3, v7}, Lva2;->S(Lxp1;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 124
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    .line 125
    invoke-virtual {v5}, Lnp1;->i()Llp1;

    move-result-object v3

    check-cast v3, Lh12;

    invoke-virtual {v3}, Lh12;->i()V

    .line 126
    invoke-virtual {v3}, Llp1;->c()V

    move-object/from16 v18, v6

    iget-object v6, v3, Llp1;->k:Lnp1;

    .line 127
    check-cast v6, Lj12;

    invoke-virtual {v6, v0}, Lj12;->D(Ljava/util/List;)V

    .line 128
    invoke-virtual {v15}, Lsa2;->j0()Lva2;

    move-result-object v0

    .line 129
    invoke-virtual {v5}, Lj12;->r()Ljava/util/List;

    move-result-object v6

    check-cast v6, Lxp1;

    invoke-virtual {v0, v6, v7}, Lva2;->S(Lxp1;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 130
    invoke-virtual {v3}, Lh12;->h()V

    .line 131
    invoke-virtual {v3}, Llp1;->c()V

    iget-object v6, v3, Llp1;->k:Lnp1;

    .line 132
    check-cast v6, Lj12;

    invoke-virtual {v6, v0}, Lj12;->B(Ljava/lang/Iterable;)V

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    .line 134
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    invoke-virtual {v5}, Lj12;->v()Lyp1;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_20
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_17

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v23, v6

    move-object/from16 v6, v22

    check-cast v6, Lh02;

    .line 136
    invoke-virtual {v6}, Lh02;->s()I

    move-result v22

    move/from16 v24, v12

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_16

    .line 137
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_16
    move-object/from16 v6, v23

    move/from16 v12, v24

    goto :goto_20

    :cond_17
    move/from16 v24, v12

    .line 138
    invoke-virtual {v3}, Lh12;->j()V

    .line 139
    invoke-virtual {v3}, Llp1;->c()V

    iget-object v6, v3, Llp1;->k:Lnp1;

    .line 140
    check-cast v6, Lj12;

    invoke-virtual {v6, v0}, Lj12;->F(Ljava/util/ArrayList;)V

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    .line 142
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 143
    invoke-virtual {v5}, Lj12;->x()Lyp1;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_18
    :goto_21
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_19

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lm12;

    .line 144
    invoke-virtual {v6}, Lm12;->s()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_18

    .line 145
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_21

    .line 146
    :cond_19
    invoke-virtual {v3}, Lh12;->k()V

    .line 147
    invoke-virtual {v3}, Llp1;->c()V

    iget-object v5, v3, Llp1;->k:Lnp1;

    .line 148
    check-cast v5, Lj12;

    invoke-virtual {v5, v0}, Lj12;->H(Ljava/lang/Iterable;)V

    .line 149
    invoke-virtual {v3}, Llp1;->e()Lnp1;

    move-result-object v0

    check-cast v0, Lj12;

    invoke-virtual {v2, v4, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_22
    move-object/from16 v0, v17

    move-object/from16 v6, v18

    move-object/from16 v3, v21

    move/from16 v12, v24

    goto/16 :goto_1f

    :cond_1a
    move-object/from16 v0, v17

    move-object/from16 v3, v21

    goto/16 :goto_1f

    .line 150
    :goto_23
    invoke-virtual {v2, v4, v5}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22

    :goto_24
    move-object v12, v2

    goto :goto_26

    :goto_25
    if-eqz v7, :cond_1b

    .line 151
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 152
    :cond_1b
    throw v0

    :cond_1c
    move-object/from16 p4, v2

    move-object/from16 v18, v6

    move/from16 v24, v12

    move-object v12, v11

    .line 153
    :goto_26
    invoke-virtual/range {p4 .. p4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_27
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    invoke-interface {v12, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj12;

    new-instance v4, Ljava/util/BitSet;

    .line 155
    invoke-direct {v4}, Ljava/util/BitSet;-><init>()V

    new-instance v5, Ljava/util/BitSet;

    .line 156
    invoke-direct {v5}, Ljava/util/BitSet;-><init>()V

    new-instance v6, Lda;

    .line 157
    invoke-direct {v6}, Lu71;-><init>()V

    if-eqz v2, :cond_1d

    .line 158
    invoke-virtual {v2}, Lj12;->w()I

    move-result v3

    if-nez v3, :cond_1e

    :cond_1d
    move-object/from16 p4, v2

    goto :goto_2a

    .line 159
    :cond_1e
    invoke-virtual {v2}, Lj12;->v()Lyp1;

    move-result-object v3

    .line 160
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1f
    :goto_28
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lh02;

    .line 161
    invoke-virtual {v7}, Lh02;->r()Z

    move-result v21

    if-eqz v21, :cond_1f

    .line 162
    invoke-virtual {v7}, Lh02;->s()I

    move-result v21

    move-object/from16 p4, v2

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 163
    invoke-virtual {v7}, Lh02;->t()Z

    move-result v21

    if-eqz v21, :cond_20

    .line 164
    invoke-virtual {v7}, Lh02;->u()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    goto :goto_29

    :cond_20
    const/4 v7, 0x0

    .line 165
    :goto_29
    invoke-virtual {v6, v2, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v2, p4

    goto :goto_28

    .line 166
    :goto_2a
    new-instance v7, Lda;

    .line 167
    invoke-direct {v7}, Lu71;-><init>()V

    if-eqz p4, :cond_21

    .line 168
    invoke-virtual/range {p4 .. p4}, Lj12;->y()I

    move-result v2

    if-nez v2, :cond_22

    :cond_21
    move-object/from16 v23, v12

    goto :goto_2c

    .line 169
    :cond_22
    invoke-virtual/range {p4 .. p4}, Lj12;->x()Lyp1;

    move-result-object v2

    .line 170
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_23
    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lm12;

    .line 171
    invoke-virtual {v3}, Lm12;->r()Z

    move-result v21

    if-eqz v21, :cond_23

    invoke-virtual {v3}, Lm12;->u()I

    move-result v21

    if-lez v21, :cond_23

    .line 172
    invoke-virtual {v3}, Lm12;->s()I

    move-result v21

    move-object/from16 v22, v2

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 173
    invoke-virtual {v3}, Lm12;->u()I

    move-result v21

    move-object/from16 v23, v12

    add-int/lit8 v12, v21, -0x1

    invoke-virtual {v3, v12}, Lm12;->v(I)J

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 174
    invoke-virtual {v7, v2, v3}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v2, v22

    move-object/from16 v12, v23

    goto :goto_2b

    :goto_2c
    if-eqz p4, :cond_26

    const/4 v2, 0x0

    .line 175
    :goto_2d
    invoke-virtual/range {p4 .. p4}, Lj12;->s()I

    move-result v3

    mul-int/lit8 v3, v3, 0x40

    if-ge v2, v3, :cond_26

    invoke-virtual/range {p4 .. p4}, Lj12;->r()Ljava/util/List;

    move-result-object v3

    .line 176
    check-cast v3, Lxp1;

    invoke-static {v3, v2}, Lva2;->Q(Lxp1;I)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 177
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 178
    iget-object v3, v3, Lzy1;->w:Lso;

    .line 179
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move/from16 v21, v13

    const-string v13, "Filter already evaluated. audience ID, filter ID"

    invoke-virtual {v3, v13, v0, v12}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 180
    invoke-virtual {v5, v2}, Ljava/util/BitSet;->set(I)V

    invoke-virtual/range {p4 .. p4}, Lj12;->t()Ljava/util/List;

    move-result-object v3

    .line 181
    check-cast v3, Lxp1;

    invoke-static {v3, v2}, Lva2;->Q(Lxp1;I)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 182
    invoke-virtual {v4, v2}, Ljava/util/BitSet;->set(I)V

    goto :goto_2e

    :cond_24
    move/from16 v21, v13

    .line 183
    :cond_25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v6, v3}, Lu71;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2e
    add-int/lit8 v2, v2, 0x1

    move/from16 v13, v21

    goto :goto_2d

    :cond_26
    move/from16 v21, v13

    .line 184
    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lj12;

    if-eqz v21, :cond_27

    if-eqz v24, :cond_27

    .line 185
    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_27

    iget-object v12, v1, Ldp1;->q:Ljava/lang/Long;

    if-eqz v12, :cond_27

    iget-object v12, v1, Ldp1;->p:Ljava/lang/Long;

    if-nez v12, :cond_28

    :cond_27
    move-object/from16 p4, v0

    goto :goto_30

    .line 186
    :cond_28
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmx1;

    .line 187
    invoke-virtual {v12}, Lmx1;->s()I

    move-result v13

    move-object/from16 p4, v0

    iget-object v0, v1, Ldp1;->q:Ljava/lang/Long;

    .line 188
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v25

    const-wide/16 v27, 0x3e8

    div-long v25, v25, v27

    .line 189
    invoke-virtual {v12}, Lmx1;->A()Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, v1, Ldp1;->p:Ljava/lang/Long;

    .line 190
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v25

    div-long v25, v25, v27

    .line 191
    :cond_29
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v6, v0}, Lu71;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2a

    .line 192
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v6, v0, v12}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    :cond_2a
    invoke-virtual {v7, v0}, Lu71;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2b

    .line 194
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v7, v0, v12}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b
    move-object/from16 v0, p4

    goto :goto_2f

    .line 195
    :goto_30
    new-instance v0, Lje2;

    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    move-object/from16 v13, p4

    move-object/from16 p1, v11

    move-object/from16 v12, v19

    move-object/from16 v11, p5

    move-object/from16 v19, v10

    move-object/from16 v10, v20

    move-object/from16 v20, v15

    move-object/from16 v15, v18

    .line 196
    invoke-direct/range {v0 .. v7}, Lje2;-><init>(Ldp1;Ljava/lang/String;Lj12;Ljava/util/BitSet;Ljava/util/BitSet;Lda;Lda;)V

    iget-object v2, v1, Ldp1;->o:Lda;

    .line 197
    invoke-virtual {v2, v13, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v15, v20

    move/from16 v13, v21

    move-object/from16 v11, p1

    move-object/from16 v20, v10

    move-object/from16 v10, v19

    move-object/from16 v19, v12

    move-object/from16 v12, v23

    goto/16 :goto_27

    :cond_2c
    move-object/from16 v10, v20

    move-object/from16 v20, v15

    move-object/from16 v15, v18

    goto/16 :goto_17

    .line 198
    :goto_31
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const-string v6, "Skipping failed audience ID"

    if-eqz v0, :cond_2d

    goto/16 :goto_43

    .line 199
    :cond_2d
    new-instance v7, Lxe0;

    .line 200
    invoke-direct {v7, v1}, Lxe0;-><init>(Ldp1;)V

    new-instance v13, Lda;

    .line 201
    invoke-direct {v13}, Lu71;-><init>()V

    .line 202
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_2e
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj02;

    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    .line 203
    invoke-virtual {v7, v2, v0}, Lxe0;->e(Ljava/lang/String;Lj02;)Lj02;

    move-result-object v24

    if-eqz v24, :cond_2e

    .line 204
    invoke-virtual/range {v20 .. v20}, Lsa2;->g0()Ldu1;

    move-result-object v2

    iget-object v3, v1, Ldp1;->m:Ljava/lang/String;

    invoke-virtual/range {v24 .. v24}, Lj02;->w()Ljava/lang/String;

    move-result-object v4

    .line 205
    invoke-virtual {v2, v3, v0, v4}, Ldu1;->V(Ljava/lang/String;Lj02;Ljava/lang/String;)Lru1;

    move-result-object v2

    .line 206
    invoke-virtual/range {v20 .. v20}, Lsa2;->g0()Ldu1;

    move-result-object v0

    .line 207
    invoke-virtual {v0, v14, v2}, Ldu1;->M(Ljava/lang/String;Lru1;)V

    if-nez p6, :cond_2e

    .line 208
    iget-wide v3, v2, Lru1;->c:J

    invoke-virtual/range {v24 .. v24}, Lj02;->w()Ljava/lang/String;

    move-result-object v5

    .line 209
    invoke-virtual {v13, v5}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_34

    .line 210
    invoke-virtual/range {v20 .. v20}, Lsa2;->g0()Ldu1;

    move-result-object v0

    move-object/from16 v27, v2

    iget-object v2, v0, Let;->j:Ljava/lang/Object;

    check-cast v2, Ly02;

    move-object/from16 p1, v2

    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    .line 211
    invoke-virtual {v0}, Laa2;->m()V

    .line 212
    invoke-virtual {v0}, Let;->l()V

    .line 213
    invoke-static {v2}, Lbh;->e(Ljava/lang/String;)V

    .line 214
    invoke-static {v5}, Lbh;->e(Ljava/lang/String;)V

    move-wide/from16 v25, v3

    new-instance v3, Lda;

    .line 215
    invoke-direct {v3}, Lu71;-><init>()V

    .line 216
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v28

    :try_start_17
    const-string v29, "event_filters"

    filled-new-array {v15, v11}, [Ljava/lang/String;

    move-result-object v30

    const-string v31, "app_id=? AND event_name=?"

    filled-new-array {v2, v5}, [Ljava/lang/String;

    move-result-object v32

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v33, 0x0

    .line 217
    invoke-virtual/range {v28 .. v35}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_17
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_17 .. :try_end_17} :catch_14
    .catchall {:try_start_17 .. :try_end_17} :catchall_a

    .line 218
    :try_start_18
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0
    :try_end_18
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_18 .. :try_end_18} :catch_13
    .catchall {:try_start_18 .. :try_end_18} :catchall_9

    if-eqz v0, :cond_31

    move-object/from16 v19, v2

    :goto_32
    const/4 v2, 0x1

    .line 219
    :try_start_19
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0
    :try_end_19
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_19 .. :try_end_19} :catch_11
    .catchall {:try_start_19 .. :try_end_19} :catchall_9

    .line 220
    :try_start_1a
    invoke-static {}, Lmx1;->D()Llx1;

    move-result-object v2

    invoke-static {v2, v0}, Lva2;->W(Llp1;[B)Llp1;

    move-result-object v0

    check-cast v0, Llx1;

    invoke-virtual {v0}, Llp1;->e()Lnp1;

    move-result-object v0

    check-cast v0, Lmx1;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_12
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1a .. :try_end_1a} :catch_11
    .catchall {:try_start_1a .. :try_end_1a} :catchall_9

    const/4 v2, 0x0

    .line 221
    :try_start_1b
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 222
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v2}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/List;
    :try_end_1b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1b .. :try_end_1b} :catch_11
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    if-nez v21, :cond_2f

    move-object/from16 p2, v4

    :try_start_1c
    new-instance v4, Ljava/util/ArrayList;

    .line 223
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 224
    invoke-virtual {v3, v2, v4}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :catchall_8
    move-exception v0

    goto :goto_36

    :catch_10
    move-exception v0

    goto :goto_37

    :cond_2f
    move-object/from16 p2, v4

    move-object/from16 v4, v21

    .line 225
    :goto_33
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_35

    :catchall_9
    move-exception v0

    move-object/from16 p2, v4

    goto :goto_36

    :catch_11
    move-exception v0

    :goto_34
    move-object/from16 p2, v4

    goto :goto_37

    :catch_12
    move-exception v0

    move-object/from16 p2, v4

    .line 226
    invoke-virtual/range {p1 .. p1}, Ly02;->b()Lzy1;

    move-result-object v2

    .line 227
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 228
    invoke-static/range {v19 .. v19}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v4

    .line 229
    invoke-virtual {v2, v12, v4, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 230
    :goto_35
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_1c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1c .. :try_end_1c} :catch_10
    .catchall {:try_start_1c .. :try_end_1c} :catchall_8

    if-nez v0, :cond_30

    .line 231
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->close()V

    move-object v0, v3

    goto :goto_3b

    :cond_30
    move-object/from16 v4, p2

    goto :goto_32

    :cond_31
    move-object/from16 v19, v2

    move-object/from16 p2, v4

    .line 232
    :try_start_1d
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_1d
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1d .. :try_end_1d} :catch_10
    .catchall {:try_start_1d .. :try_end_1d} :catchall_8

    .line 233
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->close()V

    goto :goto_3b

    :goto_36
    move-object/from16 v7, p2

    goto :goto_3c

    :catch_13
    move-exception v0

    move-object/from16 v19, v2

    goto :goto_34

    :goto_37
    move-object/from16 v2, p2

    goto :goto_3a

    :catchall_a
    move-exception v0

    goto :goto_38

    :catch_14
    move-exception v0

    move-object/from16 v19, v2

    goto :goto_39

    :goto_38
    const/4 v7, 0x0

    goto :goto_3c

    :goto_39
    const/4 v2, 0x0

    .line 234
    :goto_3a
    :try_start_1e
    invoke-virtual/range {p1 .. p1}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 235
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 236
    invoke-static/range {v19 .. v19}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v4

    .line 237
    invoke-virtual {v3, v10, v4, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 238
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_b

    if-eqz v2, :cond_32

    .line 239
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 240
    :cond_32
    :goto_3b
    invoke-virtual {v13, v5, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3d

    :catchall_b
    move-exception v0

    move-object v7, v2

    :goto_3c
    if-eqz v7, :cond_33

    .line 241
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 242
    :cond_33
    throw v0

    :cond_34
    move-object/from16 v27, v2

    move-wide/from16 v25, v3

    .line 243
    :goto_3d
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_3e
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 244
    invoke-virtual {v4, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    .line 245
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 246
    iget-object v3, v3, Lzy1;->w:Lso;

    .line 247
    invoke-virtual {v3, v2, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3e

    .line 248
    :cond_35
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 249
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v29

    const/4 v5, 0x1

    :goto_3f
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_38

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmx1;

    new-instance v21, Ldn1;

    move-object v5, v2

    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    move-object/from16 v22, v5

    const/4 v5, 0x0

    move-object/from16 v30, v0

    move-object/from16 p1, v7

    move-object/from16 v0, v21

    move-object/from16 v7, v22

    .line 250
    invoke-direct/range {v0 .. v5}, Ldn1;-><init>(Ldp1;Ljava/lang/String;ILnp1;I)V

    iget-object v2, v1, Ldp1;->p:Ljava/lang/Long;

    iget-object v5, v1, Ldp1;->q:Ljava/lang/Long;

    .line 251
    invoke-virtual {v4}, Lmx1;->s()I

    move-result v4

    .line 252
    iget-object v0, v1, Ldp1;->o:Lda;

    move-object/from16 v22, v2

    const/4 v2, 0x0

    .line 253
    invoke-virtual {v0, v7, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 254
    check-cast v0, Lje2;

    if-nez v0, :cond_36

    const/16 v28, 0x0

    :goto_40
    move-object/from16 v23, v5

    goto :goto_41

    .line 255
    :cond_36
    iget-object v0, v0, Lje2;->d:Ljava/util/BitSet;

    .line 256
    invoke-virtual {v0, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    move/from16 v28, v0

    goto :goto_40

    .line 257
    :goto_41
    invoke-virtual/range {v21 .. v28}, Ldn1;->a(Ljava/lang/Long;Ljava/lang/Long;Lj02;JLru1;Z)Z

    move-result v5

    move-object/from16 v0, v21

    if-eqz v5, :cond_37

    .line 258
    invoke-virtual {v1, v7}, Ldp1;->q(Ljava/lang/Integer;)Lje2;

    move-result-object v2

    .line 259
    invoke-virtual {v2, v0}, Lje2;->a(Ldn1;)V

    move-object v2, v7

    move-object/from16 v0, v30

    move-object/from16 v7, p1

    goto :goto_3f

    :cond_37
    iget-object v0, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 260
    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_42

    :cond_38
    move-object/from16 v30, v0

    move-object/from16 p1, v7

    move-object v7, v2

    :goto_42
    if-nez v5, :cond_39

    iget-object v0, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 261
    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_39
    move-object/from16 v7, p1

    move-object/from16 v0, v30

    goto/16 :goto_3e

    :cond_3a
    :goto_43
    if-nez p6, :cond_50

    .line 262
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3b

    goto/16 :goto_5c

    .line 263
    :cond_3b
    new-instance v2, Lda;

    .line 264
    invoke-direct {v2}, Lu71;-><init>()V

    .line 265
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_44
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lw12;

    .line 266
    invoke-virtual {v4}, Lw12;->t()Ljava/lang/String;

    move-result-object v5

    .line 267
    invoke-virtual {v2, v5}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_41

    .line 268
    invoke-virtual/range {v20 .. v20}, Lsa2;->g0()Ldu1;

    move-result-object v0

    iget-object v7, v0, Let;->j:Ljava/lang/Object;

    check-cast v7, Ly02;

    iget-object v12, v1, Ldp1;->m:Ljava/lang/String;

    .line 269
    invoke-virtual {v0}, Laa2;->m()V

    .line 270
    invoke-virtual {v0}, Let;->l()V

    .line 271
    invoke-static {v12}, Lbh;->e(Ljava/lang/String;)V

    .line 272
    invoke-static {v5}, Lbh;->e(Ljava/lang/String;)V

    new-instance v13, Lda;

    .line 273
    invoke-direct {v13}, Lu71;-><init>()V

    .line 274
    invoke-virtual {v0}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v21

    :try_start_1f
    const-string v22, "property_filters"

    filled-new-array {v15, v11}, [Ljava/lang/String;

    move-result-object v23

    const-string v24, "app_id=? AND property_name=?"

    filled-new-array {v12, v5}, [Ljava/lang/String;

    move-result-object v25

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v26, 0x0

    .line 275
    invoke-virtual/range {v21 .. v28}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14
    :try_end_1f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1f .. :try_end_1f} :catch_1a
    .catchall {:try_start_1f .. :try_end_1f} :catchall_d

    .line 276
    :try_start_20
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0
    :try_end_20
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_20 .. :try_end_20} :catch_19
    .catchall {:try_start_20 .. :try_end_20} :catchall_c

    if-eqz v0, :cond_3e

    move-object/from16 v17, v3

    :goto_45
    const/4 v3, 0x1

    .line 277
    :try_start_21
    invoke-interface {v14, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0
    :try_end_21
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_21 .. :try_end_21} :catch_16
    .catchall {:try_start_21 .. :try_end_21} :catchall_c

    .line 278
    :try_start_22
    invoke-static {}, Lsx1;->z()Lrx1;

    move-result-object v3

    invoke-static {v3, v0}, Lva2;->W(Llp1;[B)Llp1;

    move-result-object v0

    check-cast v0, Lrx1;

    invoke-virtual {v0}, Llp1;->e()Lnp1;

    move-result-object v0

    check-cast v0, Lsx1;
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_17
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_22 .. :try_end_22} :catch_16
    .catchall {:try_start_22 .. :try_end_22} :catchall_c

    const/4 v3, 0x0

    .line 279
    :try_start_23
    invoke-interface {v14, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    .line 280
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v13, v3}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;
    :try_end_23
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_23 .. :try_end_23} :catch_16
    .catchall {:try_start_23 .. :try_end_23} :catchall_c

    if-nez v16, :cond_3c

    move-object/from16 p1, v7

    :try_start_24
    new-instance v7, Ljava/util/ArrayList;

    .line 281
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 282
    invoke-virtual {v13, v3, v7}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_47

    :catchall_c
    move-exception v0

    goto :goto_4a

    :catch_15
    move-exception v0

    :goto_46
    move-object/from16 v16, v11

    goto :goto_4b

    :cond_3c
    move-object/from16 p1, v7

    move-object/from16 v7, v16

    .line 283
    :goto_47
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v16, v11

    goto :goto_49

    :catch_16
    move-exception v0

    :goto_48
    move-object/from16 p1, v7

    goto :goto_46

    :catch_17
    move-exception v0

    move-object/from16 p1, v7

    .line 284
    invoke-virtual/range {p1 .. p1}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 285
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 286
    const-string v7, "Failed to merge filter"
    :try_end_24
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_24 .. :try_end_24} :catch_15
    .catchall {:try_start_24 .. :try_end_24} :catchall_c

    move-object/from16 v16, v11

    :try_start_25
    invoke-static {v12}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v11

    invoke-virtual {v3, v7, v11, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 287
    :goto_49
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0
    :try_end_25
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_25 .. :try_end_25} :catch_18
    .catchall {:try_start_25 .. :try_end_25} :catchall_c

    if-nez v0, :cond_3d

    .line 288
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    move-object v0, v13

    goto :goto_4f

    :cond_3d
    move-object/from16 v7, p1

    move-object/from16 v11, v16

    goto :goto_45

    :catch_18
    move-exception v0

    goto :goto_4b

    :cond_3e
    move-object/from16 v17, v3

    move-object/from16 p1, v7

    move-object/from16 v16, v11

    .line 289
    :try_start_26
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_26
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_26 .. :try_end_26} :catch_18
    .catchall {:try_start_26 .. :try_end_26} :catchall_c

    .line 290
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    goto :goto_4f

    :goto_4a
    move-object v7, v14

    goto :goto_50

    :catch_19
    move-exception v0

    move-object/from16 v17, v3

    goto :goto_48

    :goto_4b
    move-object v7, v14

    goto :goto_4e

    :catchall_d
    move-exception v0

    goto :goto_4c

    :catch_1a
    move-exception v0

    move-object/from16 v17, v3

    move-object/from16 p1, v7

    move-object/from16 v16, v11

    goto :goto_4d

    :goto_4c
    const/4 v7, 0x0

    goto :goto_50

    :goto_4d
    const/4 v7, 0x0

    .line 291
    :goto_4e
    :try_start_27
    invoke-virtual/range {p1 .. p1}, Ly02;->b()Lzy1;

    move-result-object v3

    .line 292
    iget-object v3, v3, Lzy1;->o:Lso;

    .line 293
    invoke-static {v12}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v11

    .line 294
    invoke-virtual {v3, v10, v11, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 295
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_e

    if-eqz v7, :cond_3f

    .line 296
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 297
    :cond_3f
    :goto_4f
    invoke-virtual {v2, v5, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_51

    :catchall_e
    move-exception v0

    :goto_50
    if-eqz v7, :cond_40

    .line 298
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 299
    :cond_40
    throw v0

    :cond_41
    move-object/from16 v17, v3

    move-object/from16 v16, v11

    .line 300
    :goto_51
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_52
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_42

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v11, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 301
    invoke-virtual {v11, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_43

    .line 302
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v0

    .line 303
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 304
    invoke-virtual {v0, v5, v6}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_42
    move-object/from16 v11, v16

    move-object/from16 v3, v17

    goto/16 :goto_44

    .line 305
    :cond_43
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    .line 306
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/4 v12, 0x1

    :goto_53
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lsx1;

    .line 307
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v13

    .line 308
    invoke-virtual {v13}, Lzy1;->r()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    invoke-static {v13, v14}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v13

    if-eqz v13, :cond_45

    .line 309
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v13

    .line 310
    iget-object v13, v13, Lzy1;->w:Lso;

    .line 311
    invoke-virtual {v12}, Lsx1;->r()Z

    move-result v14

    if-eqz v14, :cond_44

    invoke-virtual {v12}, Lsx1;->s()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    :goto_54
    move-object/from16 v21, v0

    goto :goto_55

    :cond_44
    const/4 v14, 0x0

    goto :goto_54

    .line 312
    :goto_55
    iget-object v0, v9, Ly02;->s:Lry1;

    move-object/from16 v22, v2

    .line 313
    invoke-virtual {v12}, Lsx1;->t()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lry1;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Evaluating filter. audience, filter, property"

    .line 314
    invoke-virtual {v13, v2, v5, v14, v0}, Lso;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 315
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v0

    .line 316
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 317
    invoke-virtual/range {v20 .. v20}, Lsa2;->j0()Lva2;

    move-result-object v2

    .line 318
    invoke-virtual {v2, v12}, Lva2;->N(Lsx1;)Ljava/lang/String;

    move-result-object v2

    const-string v13, "Filter definition"

    invoke-virtual {v0, v2, v13}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_56

    :cond_45
    move-object/from16 v21, v0

    move-object/from16 v22, v2

    .line 319
    :goto_56
    invoke-virtual {v12}, Lsx1;->r()Z

    move-result v0

    if-eqz v0, :cond_46

    invoke-virtual {v12}, Lsx1;->s()I

    move-result v0

    const/16 v2, 0x100

    if-le v0, v2, :cond_47

    :cond_46
    move-object/from16 p1, v3

    goto :goto_58

    .line 320
    :cond_47
    new-instance v0, Ldn1;

    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    const/4 v13, 0x1

    move-object/from16 p1, v0

    move-object/from16 p2, v1

    move-object/from16 p3, v2

    move/from16 p4, v7

    move-object/from16 p5, v12

    move/from16 p6, v13

    .line 321
    invoke-direct/range {p1 .. p6}, Ldn1;-><init>(Ldp1;Ljava/lang/String;ILnp1;I)V

    move-object/from16 v2, p1

    move/from16 v0, p4

    iget-object v7, v1, Ldp1;->p:Ljava/lang/Long;

    iget-object v13, v1, Ldp1;->q:Ljava/lang/Long;

    .line 322
    invoke-virtual {v12}, Lsx1;->s()I

    move-result v12

    .line 323
    iget-object v14, v1, Ldp1;->o:Lda;

    move-object/from16 p1, v3

    const/4 v3, 0x0

    .line 324
    invoke-virtual {v14, v5, v3}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 325
    check-cast v14, Lje2;

    if-nez v14, :cond_48

    const/4 v3, 0x0

    goto :goto_57

    .line 326
    :cond_48
    iget-object v3, v14, Lje2;->d:Ljava/util/BitSet;

    .line 327
    invoke-virtual {v3, v12}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    .line 328
    :goto_57
    invoke-virtual {v2, v7, v13, v4, v3}, Ldn1;->b(Ljava/lang/Long;Ljava/lang/Long;Lw12;Z)Z

    move-result v12

    if-eqz v12, :cond_49

    .line 329
    invoke-virtual {v1, v5}, Ldp1;->q(Ljava/lang/Integer;)Lje2;

    move-result-object v3

    .line 330
    invoke-virtual {v3, v2}, Lje2;->a(Ldn1;)V

    move-object/from16 v3, p1

    move v7, v0

    move-object/from16 v0, v21

    move-object/from16 v2, v22

    goto/16 :goto_53

    :cond_49
    iget-object v0, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 331
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    .line 332
    :goto_58
    invoke-virtual {v9}, Ly02;->b()Lzy1;

    move-result-object v0

    .line 333
    iget-object v0, v0, Lzy1;->r:Lso;

    .line 334
    iget-object v2, v1, Ldp1;->m:Ljava/lang/String;

    invoke-static {v2}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v2

    .line 335
    invoke-virtual {v12}, Lsx1;->r()Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-virtual {v12}, Lsx1;->s()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_59

    :cond_4a
    const/4 v7, 0x0

    :goto_59
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v7, "Invalid property filter ID. appId, id"

    .line 336
    invoke-virtual {v0, v7, v2, v3}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_5b

    :cond_4b
    move-object/from16 v21, v0

    move-object/from16 v22, v2

    move-object/from16 p1, v3

    :goto_5a
    if-nez v12, :cond_4c

    :goto_5b
    iget-object v0, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 337
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_4c
    move-object/from16 v3, p1

    move-object/from16 v0, v21

    move-object/from16 v2, v22

    goto/16 :goto_52

    .line 338
    :cond_4d
    :goto_5c
    new-instance v2, Ljava/util/ArrayList;

    .line 339
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, v1, Ldp1;->o:Lda;

    .line 340
    invoke-virtual {v0}, Lda;->keySet()Ljava/util/Set;

    move-result-object v0

    iget-object v3, v1, Ldp1;->n:Ljava/util/HashSet;

    .line 341
    check-cast v0, Lhl0;

    invoke-virtual {v0, v3}, Lhl0;->removeAll(Ljava/util/Collection;)Z

    .line 342
    invoke-virtual {v0}, Lhl0;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4e
    :goto_5d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, v1, Ldp1;->o:Lda;

    .line 343
    invoke-virtual {v5, v0}, Lu71;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lje2;

    .line 344
    invoke-static {v5}, Lbh;->h(Ljava/lang/Object;)V

    .line 345
    invoke-virtual {v5, v4}, Lje2;->b(I)Luz1;

    move-result-object v4

    .line 346
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 347
    invoke-virtual/range {v20 .. v20}, Lsa2;->g0()Ldu1;

    move-result-object v5

    iget-object v6, v5, Let;->j:Ljava/lang/Object;

    check-cast v6, Ly02;

    iget-object v7, v1, Ldp1;->m:Ljava/lang/String;

    .line 348
    invoke-virtual {v4}, Luz1;->t()Lj12;

    move-result-object v4

    .line 349
    invoke-virtual {v5}, Laa2;->m()V

    .line 350
    invoke-virtual {v5}, Let;->l()V

    .line 351
    invoke-static {v7}, Lbh;->e(Ljava/lang/String;)V

    .line 352
    invoke-static {v4}, Lbh;->h(Ljava/lang/Object;)V

    .line 353
    invoke-virtual {v4}, Lqo1;->a()[B

    move-result-object v4

    new-instance v9, Landroid/content/ContentValues;

    .line 354
    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    const-string v10, "app_id"

    .line 355
    invoke-virtual {v9, v10, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    invoke-virtual {v9, v15, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 357
    invoke-virtual {v9, v8, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 358
    :try_start_28
    invoke-virtual {v5}, Ldu1;->c0()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v4, "audience_filter_values"
    :try_end_28
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_28 .. :try_end_28} :catch_1c

    const/4 v5, 0x5

    const/4 v10, 0x0

    .line 359
    :try_start_29
    invoke-virtual {v0, v4, v10, v9, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v4

    const-wide/16 v11, -0x1

    cmp-long v0, v4, v11

    if-nez v0, :cond_4e

    .line 360
    invoke-virtual {v6}, Ly02;->b()Lzy1;

    move-result-object v0

    .line 361
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 362
    const-string v4, "Failed to insert filter results (got -1). appId"

    invoke-static {v7}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v5

    .line 363
    invoke-virtual {v0, v5, v4}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_29
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_29 .. :try_end_29} :catch_1b

    goto :goto_5d

    :catch_1b
    move-exception v0

    goto :goto_5e

    :catch_1c
    move-exception v0

    const/4 v10, 0x0

    .line 364
    :goto_5e
    invoke-virtual {v6}, Ly02;->b()Lzy1;

    move-result-object v4

    .line 365
    iget-object v4, v4, Lzy1;->o:Lso;

    .line 366
    invoke-static {v7}, Lzy1;->p(Ljava/lang/String;)Lxy1;

    move-result-object v5

    const-string v6, "Error storing filter results. appId"

    .line 367
    invoke-virtual {v4, v6, v5, v0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_5d

    :cond_4f
    return-object v2

    .line 368
    :cond_50
    new-instance v0, Ljava/util/ArrayList;

    .line 369
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    :goto_5f
    if-eqz v7, :cond_51

    .line 370
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 371
    :cond_51
    throw v0
.end method

.method public final q(Ljava/lang/Integer;)Lje2;
    .locals 2

    .line 1
    iget-object v0, p0, Ldp1;->o:Lda;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lu71;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ldp1;->o:Lda;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, v0}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lje2;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance v0, Lje2;

    .line 20
    .line 21
    iget-object v1, p0, Ldp1;->m:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Lje2;-><init>(Ldp1;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ldp1;->o:Lda;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    return-object v0
.end method
