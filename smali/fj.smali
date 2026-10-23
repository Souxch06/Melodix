.class public final synthetic Lfj;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpa1;
.implements Llw;
.implements Ljm;
.implements Ljq;
.implements Lor0;
.implements Lfb1;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lfj;->j:I

    .line 2
    .line 3
    iput-object p2, p0, Lfj;->k:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Llw0;)V
    .locals 4

    .line 1
    iget v0, p0, Lfj;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lur;

    .line 9
    .line 10
    invoke-interface {p1}, Llw0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, La50;

    .line 15
    .line 16
    const-string v0, "firebase"

    .line 17
    .line 18
    check-cast p1, Lyz0;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lyz0;->b(Ljava/lang/String;)Lv40;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lv40;->i:Ler0;

    .line 25
    .line 26
    iget-object v0, p1, Ler0;->n:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ljava/util/Set;

    .line 29
    .line 30
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Ler0;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Lxm;

    .line 36
    .line 37
    invoke-virtual {v0}, Lxm;->b()Ljd2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p1, Ler0;->m:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v1, Ljava/util/concurrent/Executor;

    .line 44
    .line 45
    new-instance v2, Lgn;

    .line 46
    .line 47
    const/4 v3, 0x4

    .line 48
    invoke-direct {v2, p1, v0, p0, v3}, Lgn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ljd2;->d(Ljava/util/concurrent/Executor;Lcs0;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :pswitch_0
    check-cast p0, Ltr;

    .line 56
    .line 57
    iget-object p0, p0, Ltr;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 58
    .line 59
    invoke-interface {p1}, Llw0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ltr;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public b()Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lfj;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Ler0;

    .line 10
    .line 11
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lh21;

    .line 14
    .line 15
    new-instance v2, Lo40;

    .line 16
    .line 17
    const/16 v3, 0x18

    .line 18
    .line 19
    invoke-direct {v2, v3}, Lo40;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lh21;->h(Lf21;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Iterable;

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lqf;

    .line 43
    .line 44
    iget-object v3, p0, Ler0;->m:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v3, Lc9;

    .line 47
    .line 48
    const/4 v4, 0x1

    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-virtual {v3, v2, v4, v5}, Lc9;->I(Lqf;IZ)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-object v1

    .line 55
    :pswitch_0
    check-cast p0, Lve;

    .line 56
    .line 57
    iget-object p0, p0, Lve;->i:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p0, Lh21;

    .line 60
    .line 61
    invoke-virtual {p0}, Lh21;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 66
    .line 67
    .line 68
    :try_start_0
    const-string v2, "DELETE FROM log_event_dropped"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v3, "UPDATE global_log_event_state SET last_metrics_upload_ms="

    .line 80
    .line 81
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lh21;->k:Lok;

    .line 85
    .line 86
    invoke-interface {p0}, Lok;->c()J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 108
    .line 109
    .line 110
    return-object v1

    .line 111
    :catchall_0
    move-exception p0

    .line 112
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 113
    .line 114
    .line 115
    throw p0

    .line 116
    nop

    .line 117
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
    .end packed-switch
.end method

.method public c(Landroid/view/View;Lkk1;)Lkk1;
    .locals 5

    .line 1
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 4
    .line 5
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x7

    .line 11
    iget-object v1, p2, Lkk1;->a:Lhk1;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lhk1;->f(I)Lne0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget v1, v0, Lne0;->b:I

    .line 21
    .line 22
    iget v2, v0, Lne0;->a:I

    iget v4, v0, Lne0;->d:I

    .line 23
    .line 24
    iget v0, v0, Lne0;->c:I

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {p1, v2, v3, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    const p1, 0x7f09022f
    invoke-virtual {p0, p1}, Le6;->findViewById(I)Landroid/view/View;
    move-result-object p1
    if-eqz p1, :native_insets_done
    invoke-virtual {p1, v2, v1, v0, v4}, Landroid/view/View;->setPadding(IIII)V
    :native_insets_done

    .line 28
    .line 29
    .line 30
    const p1, 0x7f090060

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Le6;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    check-cast v0, Lfp;

    .line 47
    .line 48
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 57
    .line 58
    const/high16 v4, 0x40a00000    # 5.0f

    .line 59
    .line 60
    mul-float/2addr v4, v2

    .line 61
    float-to-int v2, v4

    .line 62
    add-int/2addr v2, v1

    .line 63
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    sput v1, Lml;->n:I

    .line 69
    .line 70
    sget-object p1, Lml;->g:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    instance-of v2, v0, Lfp;

    .line 79
    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    check-cast v0, Lfp;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const/4 v0, 0x0

    .line 86
    :goto_0
    if-nez v0, :cond_2

    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_2
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    sget-object p1, Lml;->g:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    if-eqz p1, :cond_4

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_4

    .line 103
    .line 104
    const/4 p1, 0x1

    .line 105
    goto :goto_1

    .line 106
    :cond_4
    move p1, v3

    .line 107
    :goto_1
    sget-object v0, Lml;->g:Landroid/widget/LinearLayout;

    .line 108
    .line 109
    if-eqz v0, :cond_5

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 133
    .line 134
    :goto_2
    const/high16 v2, 0x42600000    # 56.0f

    .line 135
    .line 136
    mul-float/2addr v0, v2

    .line 137
    float-to-int v0, v0

    .line 138
    if-eqz p1, :cond_6

    .line 139
    .line 140
    sget p1, Lml;->n:I

    .line 141
    .line 142
    add-int/2addr p1, v0

    .line 143
    goto :goto_3

    .line 144
    :cond_6
    move p1, v3

    .line 145
    :goto_3
    sget-object v0, Lml;->l:Ljava/lang/ref/WeakReference;

    .line 146
    .line 147
    if-eqz v0, :cond_7

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Landroid/view/View;

    .line 154
    .line 155
    if-eqz v0, :cond_7

    .line 156
    .line 157
    invoke-virtual {v0, v3, p1, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 158
    .line 159
    .line 160
    :cond_7
    :goto_4
    const p1, 0x7f090187

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, p1}, Le6;->findViewById(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    if-eqz p1, :cond_8

    .line 168
    .line 169
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 174
    .line 175
    .line 176
    check-cast v0, Lfp;

    .line 177
    .line 178
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 181
    .line 182
    .line 183
    :cond_8
    if-lez v1, :cond_9

    .line 184
    .line 185
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 186
    .line 187
    int-to-float p1, v1

    .line 188
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 197
    .line 198
    div-float/2addr p1, p0

    .line 199
    float-to-int p0, p1

    .line 200
    sput p0, Lcom/melodix/music/AppSingleton;->U:I

    .line 201
    .line 202
    :cond_9
    return-object p2
.end method

.method public d(Ljd2;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget p1, p0, Lfj;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 5
    .line 6
    packed-switch p1, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :pswitch_0
    check-cast p0, Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :pswitch_1
    check-cast p0, Lmr;

    .line 26
    .line 27
    invoke-virtual {p0}, Lmr;->call()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljd2;

    .line 32
    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e(Lc9;)Lgj;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v0, v0, Lfj;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lhj;

    .line 8
    .line 9
    iget-object v2, v1, Lc9;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ljava/net/URL;

    .line 12
    .line 13
    const-string v3, "CctTransportBackend"

    .line 14
    .line 15
    invoke-static {v3}, Lbe2;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    const/4 v5, 0x4

    .line 20
    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const-string v6, "Making request to: %s"

    .line 31
    .line 32
    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/net/HttpURLConnection;

    .line 40
    .line 41
    const/16 v4, 0x7530

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 44
    .line 45
    .line 46
    const v4, 0x1fbd0

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v4}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 50
    .line 51
    .line 52
    const/4 v4, 0x1

    .line 53
    invoke-virtual {v2, v4}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 58
    .line 59
    .line 60
    const-string v4, "POST"

    .line 61
    .line 62
    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-string v4, "User-Agent"

    .line 66
    .line 67
    const-string v6, "datatransport/3.3.0 android/"

    .line 68
    .line 69
    invoke-virtual {v2, v4, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string v4, "Content-Encoding"

    .line 73
    .line 74
    const-string v6, "gzip"

    .line 75
    .line 76
    invoke-virtual {v2, v4, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-string v7, "application/json"

    .line 80
    .line 81
    const-string v8, "Content-Type"

    .line 82
    .line 83
    invoke-virtual {v2, v8, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const-string v7, "Accept-Encoding"

    .line 87
    .line 88
    invoke-virtual {v2, v7, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v7, v1, Lc9;->m:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v7, Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v7, :cond_1

    .line 96
    .line 97
    const-string v9, "X-Goog-Api-Key"

    .line 98
    .line 99
    invoke-virtual {v2, v9, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 103
    .line 104
    .line 105
    move-result-object v10
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lb10; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 106
    :try_start_1
    new-instance v11, Ljava/util/zip/GZIPOutputStream;

    .line 107
    .line 108
    invoke-direct {v11, v10}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 109
    .line 110
    .line 111
    :try_start_2
    iget-object v0, v0, Lhj;->a:Lpa0;

    .line 112
    .line 113
    iget-object v1, v1, Lc9;->l:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v1, Ltc;

    .line 116
    .line 117
    new-instance v13, Ljava/io/BufferedWriter;

    .line 118
    .line 119
    new-instance v12, Ljava/io/OutputStreamWriter;

    .line 120
    .line 121
    invoke-direct {v12, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {v13, v12}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 125
    .line 126
    .line 127
    new-instance v12, Lah0;

    .line 128
    .line 129
    iget-object v0, v0, Lpa0;->k:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast v0, Lug0;

    .line 132
    .line 133
    iget-object v14, v0, Lug0;->a:Ljava/util/HashMap;

    .line 134
    .line 135
    iget-object v7, v0, Lug0;->b:Ljava/util/HashMap;

    .line 136
    .line 137
    iget-object v9, v0, Lug0;->c:Lrg0;

    .line 138
    .line 139
    iget-boolean v0, v0, Lug0;->d:Z

    .line 140
    .line 141
    move/from16 v17, v0

    .line 142
    .line 143
    move-object v15, v7

    .line 144
    move-object/from16 v16, v9

    .line 145
    .line 146
    invoke-direct/range {v12 .. v17}, Lah0;-><init>(Ljava/io/Writer;Ljava/util/HashMap;Ljava/util/HashMap;Lrg0;Z)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v12, v1}, Lah0;->h(Ljava/lang/Object;)Lah0;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v12}, Lah0;->j()V

    .line 153
    .line 154
    .line 155
    iget-object v0, v12, Lah0;->b:Landroid/util/JsonWriter;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroid/util/JsonWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 158
    .line 159
    .line 160
    :try_start_3
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 161
    .line 162
    .line 163
    if-eqz v10, :cond_2

    .line 164
    .line 165
    :try_start_4
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/net/ConnectException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lb10; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 166
    .line 167
    .line 168
    goto :goto_0

    .line 169
    :catch_0
    const-wide/16 v4, 0x0

    .line 170
    .line 171
    const/4 v6, 0x0

    .line 172
    goto/16 :goto_c

    .line 173
    .line 174
    :cond_2
    :goto_0
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-static {v3}, Lbe2;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    invoke-static {v7, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    if-eqz v5, :cond_3

    .line 191
    .line 192
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    const-string v5, "Status Code: %d"

    .line 197
    .line 198
    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    :cond_3
    const-string v1, "Content-Type: %s"

    .line 202
    .line 203
    invoke-virtual {v2, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    invoke-static {v3, v1, v5}, Lbe2;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    const-string v1, "Content-Encoding: %s"

    .line 211
    .line 212
    invoke-virtual {v2, v4}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    invoke-static {v3, v1, v5}, Lbe2;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 217
    .line 218
    .line 219
    const/16 v1, 0x12e

    .line 220
    .line 221
    if-eq v0, v1, :cond_b

    .line 222
    .line 223
    const/16 v1, 0x12d

    .line 224
    .line 225
    if-eq v0, v1, :cond_b

    .line 226
    .line 227
    const/16 v1, 0x133

    .line 228
    .line 229
    if-ne v0, v1, :cond_4

    .line 230
    .line 231
    goto :goto_6

    .line 232
    :cond_4
    const/16 v1, 0xc8

    .line 233
    .line 234
    if-eq v0, v1, :cond_5

    .line 235
    .line 236
    new-instance v1, Lgj;

    .line 237
    .line 238
    const-wide/16 v2, 0x0

    .line 239
    .line 240
    const/4 v4, 0x0

    .line 241
    invoke-direct {v1, v0, v4, v2, v3}, Lgj;-><init>(ILjava/net/URL;J)V

    .line 242
    .line 243
    .line 244
    return-object v1

    .line 245
    :cond_5
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    :try_start_5
    invoke-virtual {v2, v4}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-eqz v2, :cond_6

    .line 258
    .line 259
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    .line 260
    .line 261
    invoke-direct {v2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 262
    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_6
    move-object v2, v1

    .line 266
    :goto_1
    :try_start_6
    new-instance v3, Ljava/io/BufferedReader;

    .line 267
    .line 268
    new-instance v4, Ljava/io/InputStreamReader;

    .line 269
    .line 270
    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 271
    .line 272
    .line 273
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 274
    .line 275
    .line 276
    invoke-static {v3}, Lye;->a(Ljava/io/BufferedReader;)Lye;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    iget-wide v3, v3, Lye;->a:J

    .line 281
    .line 282
    new-instance v5, Lgj;

    .line 283
    .line 284
    const/4 v6, 0x0

    .line 285
    invoke-direct {v5, v0, v6, v3, v4}, Lgj;-><init>(ILjava/net/URL;J)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 286
    .line 287
    .line 288
    if-eqz v2, :cond_7

    .line 289
    .line 290
    :try_start_7
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 291
    .line 292
    .line 293
    goto :goto_2

    .line 294
    :catchall_0
    move-exception v0

    .line 295
    move-object v2, v0

    .line 296
    goto :goto_4

    .line 297
    :cond_7
    :goto_2
    if-eqz v1, :cond_8

    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 300
    .line 301
    .line 302
    :cond_8
    return-object v5

    .line 303
    :catchall_1
    move-exception v0

    .line 304
    move-object v3, v0

    .line 305
    if-eqz v2, :cond_9

    .line 306
    .line 307
    :try_start_8
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 308
    .line 309
    .line 310
    goto :goto_3

    .line 311
    :catchall_2
    move-exception v0

    .line 312
    :try_start_9
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 313
    .line 314
    .line 315
    :cond_9
    :goto_3
    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 316
    :goto_4
    if-eqz v1, :cond_a

    .line 317
    .line 318
    :try_start_a
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 319
    .line 320
    .line 321
    goto :goto_5

    .line 322
    :catchall_3
    move-exception v0

    .line 323
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 324
    .line 325
    .line 326
    :cond_a
    :goto_5
    throw v2

    .line 327
    :cond_b
    :goto_6
    const-string v1, "Location"

    .line 328
    .line 329
    invoke-virtual {v2, v1}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    new-instance v2, Lgj;

    .line 334
    .line 335
    new-instance v3, Ljava/net/URL;

    .line 336
    .line 337
    invoke-direct {v3, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    const-wide/16 v4, 0x0

    .line 341
    .line 342
    invoke-direct {v2, v0, v3, v4, v5}, Lgj;-><init>(ILjava/net/URL;J)V

    .line 343
    .line 344
    .line 345
    return-object v2

    .line 346
    :catchall_4
    move-exception v0

    .line 347
    move-object v1, v0

    .line 348
    goto :goto_a

    .line 349
    :goto_7
    move-object v1, v0

    .line 350
    goto :goto_8

    .line 351
    :catchall_5
    move-exception v0

    .line 352
    goto :goto_7

    .line 353
    :goto_8
    :try_start_b
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 354
    .line 355
    .line 356
    goto :goto_9

    .line 357
    :catchall_6
    move-exception v0

    .line 358
    :try_start_c
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 359
    .line 360
    .line 361
    :goto_9
    throw v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 362
    :goto_a
    if-eqz v10, :cond_c

    .line 363
    .line 364
    :try_start_d
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 365
    .line 366
    .line 367
    goto :goto_b

    .line 368
    :catchall_7
    move-exception v0

    .line 369
    :try_start_e
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 370
    .line 371
    .line 372
    :cond_c
    :goto_b
    throw v1
    :try_end_e
    .catch Ljava/net/ConnectException; {:try_start_e .. :try_end_e} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_e .. :try_end_e} :catch_0
    .catch Lb10; {:try_start_e .. :try_end_e} :catch_1
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_1

    .line 373
    :catch_1
    invoke-static {v3}, Lbe2;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    new-instance v0, Lgj;

    .line 377
    .line 378
    const/16 v1, 0x190

    .line 379
    .line 380
    const-wide/16 v4, 0x0

    .line 381
    .line 382
    const/4 v6, 0x0

    .line 383
    invoke-direct {v0, v1, v6, v4, v5}, Lgj;-><init>(ILjava/net/URL;J)V

    .line 384
    .line 385
    .line 386
    goto :goto_d

    .line 387
    :goto_c
    invoke-static {v3}, Lbe2;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    new-instance v0, Lgj;

    .line 391
    .line 392
    const/16 v1, 0x1f4

    .line 393
    .line 394
    invoke-direct {v0, v1, v6, v4, v5}, Lgj;-><init>(ILjava/net/URL;J)V

    .line 395
    .line 396
    .line 397
    :goto_d
    return-object v0
.end method

.method public f(Lbv1;ILandroid/os/Bundle;)Z
    .locals 5

    .line 1
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll7;

    .line 4
    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x19

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-lt v0, v1, :cond_1

    .line 11
    .line 12
    and-int/2addr p2, v2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    :try_start_0
    iget-object p2, p1, Lbv1;->k:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p2, Lle0;

    .line 18
    .line 19
    invoke-interface {p2}, Lle0;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    iget-object p2, p1, Lbv1;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p2, Lle0;

    .line 25
    .line 26
    invoke-interface {p2}, Lle0;->a()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Landroid/os/Parcelable;

    .line 31
    .line 32
    if-nez p3, :cond_0

    .line 33
    .line 34
    new-instance p3, Landroid/os/Bundle;

    .line 35
    .line 36
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    .line 41
    .line 42
    invoke-direct {v1, p3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    move-object p3, v1

    .line 46
    :goto_0
    const-string v1, "androidx.core.view.extra.INPUT_CONTENT_INFO"

    .line 47
    .line 48
    invoke-virtual {p3, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    new-instance p2, Landroid/content/ClipData;

    .line 52
    .line 53
    iget-object p1, p1, Lbv1;->k:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p1, Lle0;

    .line 56
    .line 57
    invoke-interface {p1}, Lle0;->getDescription()Landroid/content/ClipDescription;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v3, Landroid/content/ClipData$Item;

    .line 62
    .line 63
    invoke-interface {p1}, Lle0;->b()Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p2, v1, v3}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 71
    .line 72
    .line 73
    const/16 v1, 0x1f

    .line 74
    .line 75
    const/4 v3, 0x2

    .line 76
    if-lt v0, v1, :cond_2

    .line 77
    .line 78
    new-instance v0, Lpa0;

    .line 79
    .line 80
    invoke-direct {v0, p2, v3}, Lpa0;-><init>(Landroid/content/ClipData;I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    new-instance v0, Lxp;

    .line 85
    .line 86
    invoke-direct {v0}, Lxp;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p2, v0, Lxp;->k:Landroid/content/ClipData;

    .line 90
    .line 91
    iput v3, v0, Lxp;->l:I

    .line 92
    .line 93
    :goto_1
    invoke-interface {p1}, Lle0;->d()Landroid/net/Uri;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {v0, p1}, Lwp;->c(Landroid/net/Uri;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v0, p3}, Lwp;->setExtras(Landroid/os/Bundle;)V

    .line 101
    .line 102
    .line 103
    invoke-interface {v0}, Lwp;->build()Lzp;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p0, p1}, Lzh1;->g(Landroid/view/View;Lzp;)Lzp;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    if-nez p0, :cond_3

    .line 112
    .line 113
    return v2

    .line 114
    :catch_0
    :cond_3
    const/4 p0, 0x0

    .line 115
    return p0
.end method

.method public h(Li7;)Ljava/lang/Object;
    .locals 43

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v0, v0, Lfj;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;

    .line 8
    .line 9
    sget v2, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->d:I

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    const-class v2, Lu30;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Li7;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    move-object v4, v2

    .line 21
    check-cast v4, Lu30;

    .line 22
    .line 23
    const-class v2, Lh40;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Li7;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lh40;

    .line 30
    .line 31
    const-class v3, Ltr;

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Li7;->n(Ljava/lang/Class;)Lis0;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-class v5, Lj4;

    .line 38
    .line 39
    invoke-virtual {v1, v5}, Li7;->n(Ljava/lang/Class;)Lis0;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const-class v6, La50;

    .line 44
    .line 45
    invoke-virtual {v1, v6}, Li7;->n(Ljava/lang/Class;)Lis0;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iget-object v7, v0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->a:Lsw0;

    .line 50
    .line 51
    invoke-virtual {v1, v7}, Li7;->g(Lsw0;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    check-cast v7, Ljava/util/concurrent/ExecutorService;

    .line 56
    .line 57
    iget-object v8, v0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->b:Lsw0;

    .line 58
    .line 59
    invoke-virtual {v1, v8}, Li7;->g(Lsw0;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    check-cast v8, Ljava/util/concurrent/ExecutorService;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->c:Lsw0;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Li7;->g(Lsw0;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ljava/util/concurrent/ExecutorService;

    .line 72
    .line 73
    const-string v1, ""

    .line 74
    .line 75
    invoke-virtual {v4}, Lu30;->a()V

    .line 76
    .line 77
    .line 78
    iget-object v14, v4, Lu30;->a:Landroid/content/Context;

    .line 79
    .line 80
    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    new-instance v13, Lc9;

    .line 85
    .line 86
    invoke-direct {v13, v7, v8}, Lc9;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;)V

    .line 87
    .line 88
    .line 89
    new-instance v10, Lm30;

    .line 90
    .line 91
    invoke-direct {v10, v14}, Lm30;-><init>(Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    new-instance v7, Lqt;

    .line 95
    .line 96
    invoke-direct {v7, v4}, Lqt;-><init>(Lu30;)V

    .line 97
    .line 98
    .line 99
    new-instance v8, Lpd0;

    .line 100
    .line 101
    invoke-direct {v8, v14, v9, v2, v7}, Lpd0;-><init>(Landroid/content/Context;Ljava/lang/String;Lh40;Lqt;)V

    .line 102
    .line 103
    .line 104
    new-instance v2, Ltr;

    .line 105
    .line 106
    invoke-direct {v2, v3}, Ltr;-><init>(Lis0;)V

    .line 107
    .line 108
    .line 109
    new-instance v3, Lm4;

    .line 110
    .line 111
    invoke-direct {v3, v5}, Lm4;-><init>(Lis0;)V

    .line 112
    .line 113
    .line 114
    new-instance v11, Llr;

    .line 115
    .line 116
    invoke-direct {v11, v7, v10}, Llr;-><init>(Lqt;Lm30;)V

    .line 117
    .line 118
    .line 119
    sget-object v5, Ll50;->a:Ll50;

    .line 120
    .line 121
    sget-object v5, Lh51;->j:Lh51;

    .line 122
    .line 123
    sget-object v9, Ll50;->a:Ll50;

    .line 124
    .line 125
    invoke-static {v5}, Ll50;->a(Lh51;)Lj50;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    iget-object v12, v9, Lj50;->b:Llr;

    .line 130
    .line 131
    const/4 v15, 0x0

    .line 132
    if-eqz v12, :cond_0

    .line 133
    .line 134
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_0
    iput-object v11, v9, Lj50;->b:Llr;

    .line 139
    .line 140
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    iget-object v5, v9, Lj50;->a:Lzo0;

    .line 144
    .line 145
    invoke-virtual {v5, v15}, Lzo0;->f(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    :goto_0
    new-instance v12, Lny0;

    .line 149
    .line 150
    const/4 v5, 0x1

    .line 151
    invoke-direct {v12, v5, v6}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    new-instance v6, Lsr;

    .line 155
    .line 156
    move-object/from16 v20, v8

    .line 157
    .line 158
    new-instance v8, Ll4;

    .line 159
    .line 160
    invoke-direct {v8, v3}, Ll4;-><init>(Lm4;)V

    .line 161
    .line 162
    .line 163
    new-instance v9, Ll4;

    .line 164
    .line 165
    invoke-direct {v9, v3}, Ll4;-><init>(Lm4;)V

    .line 166
    .line 167
    .line 168
    move-object v3, v6

    .line 169
    move-object v6, v2

    .line 170
    move v2, v5

    .line 171
    move-object/from16 v5, v20

    .line 172
    .line 173
    invoke-direct/range {v3 .. v13}, Lsr;-><init>(Lu30;Lpd0;Ltr;Lqt;Ll4;Ll4;Lm30;Llr;Lny0;Lc9;)V

    .line 174
    .line 175
    .line 176
    move-object v5, v3

    .line 177
    move-object v3, v13

    .line 178
    iget-object v6, v5, Lsr;->o:Lc9;

    .line 179
    .line 180
    invoke-virtual {v4}, Lu30;->a()V

    .line 181
    .line 182
    .line 183
    iget-object v4, v4, Lu30;->c:Lj40;

    .line 184
    .line 185
    iget-object v4, v4, Lj40;->b:Ljava/lang/String;

    .line 186
    .line 187
    const-string v8, "com.google.firebase.crashlytics.mapping_file_id"

    .line 188
    .line 189
    const-string v9, "string"

    .line 190
    .line 191
    invoke-static {v14, v8, v9}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    if-nez v8, :cond_1

    .line 196
    .line 197
    const-string v8, "com.crashlytics.android.build_id"

    .line 198
    .line 199
    invoke-static {v14, v8, v9}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result v8

    .line 203
    :cond_1
    if-eqz v8, :cond_2

    .line 204
    .line 205
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object v9

    .line 209
    invoke-virtual {v9, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v8

    .line 213
    move-object/from16 v23, v8

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_2
    move-object/from16 v23, v15

    .line 217
    .line 218
    :goto_1
    new-instance v8, Ljava/util/ArrayList;

    .line 219
    .line 220
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string v9, "com.google.firebase.crashlytics.build_ids_lib"

    .line 224
    .line 225
    const-string v11, "array"

    .line 226
    .line 227
    invoke-static {v14, v9, v11}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    const-string v12, "com.google.firebase.crashlytics.build_ids_arch"

    .line 232
    .line 233
    invoke-static {v14, v12, v11}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v12

    .line 237
    const-string v13, "com.google.firebase.crashlytics.build_ids_build_id"

    .line 238
    .line 239
    invoke-static {v14, v13, v11}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    move-result v11

    .line 243
    if-eqz v9, :cond_3

    .line 244
    .line 245
    if-eqz v12, :cond_3

    .line 246
    .line 247
    if-nez v11, :cond_4

    .line 248
    .line 249
    :cond_3
    move-object/from16 v22, v4

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_4
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 253
    .line 254
    .line 255
    move-result-object v15

    .line 256
    invoke-virtual {v15, v9}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v9

    .line 260
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 261
    .line 262
    .line 263
    move-result-object v15

    .line 264
    invoke-virtual {v15, v12}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v12

    .line 268
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 269
    .line 270
    .line 271
    move-result-object v15

    .line 272
    invoke-virtual {v15, v11}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v11

    .line 276
    array-length v15, v9

    .line 277
    array-length v2, v11

    .line 278
    if-ne v15, v2, :cond_5

    .line 279
    .line 280
    array-length v2, v12

    .line 281
    array-length v15, v11

    .line 282
    if-eq v2, v15, :cond_6

    .line 283
    .line 284
    :cond_5
    move-object/from16 v22, v4

    .line 285
    .line 286
    goto :goto_3

    .line 287
    :cond_6
    const/4 v2, 0x0

    .line 288
    :goto_2
    array-length v15, v11

    .line 289
    if-ge v2, v15, :cond_7

    .line 290
    .line 291
    new-instance v15, Lmh;

    .line 292
    .line 293
    aget-object v13, v9, v2

    .line 294
    .line 295
    move/from16 v16, v2

    .line 296
    .line 297
    aget-object v2, v12, v16

    .line 298
    .line 299
    move-object/from16 v22, v4

    .line 300
    .line 301
    aget-object v4, v11, v16

    .line 302
    .line 303
    invoke-direct {v15, v13, v2, v4}, Lmh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v8, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    add-int/lit8 v2, v16, 0x1

    .line 310
    .line 311
    move-object/from16 v4, v22

    .line 312
    .line 313
    goto :goto_2

    .line 314
    :cond_7
    move-object/from16 v22, v4

    .line 315
    .line 316
    goto :goto_5

    .line 317
    :goto_3
    const-string v2, "Lengths did not match: %d %d %d"

    .line 318
    .line 319
    array-length v4, v9

    .line 320
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    array-length v9, v12

    .line 325
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 326
    .line 327
    .line 328
    move-result-object v9

    .line 329
    array-length v11, v11

    .line 330
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 331
    .line 332
    .line 333
    move-result-object v11

    .line 334
    filled-new-array {v4, v9, v11}, [Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    goto :goto_5

    .line 342
    :goto_4
    const-string v2, "Could not find resources: %d %d %d"

    .line 343
    .line 344
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 349
    .line 350
    .line 351
    move-result-object v9

    .line 352
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 353
    .line 354
    .line 355
    move-result-object v11

    .line 356
    filled-new-array {v4, v9, v11}, [Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    :goto_5
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 364
    .line 365
    .line 366
    move-result v2

    .line 367
    const/4 v4, 0x0

    .line 368
    :goto_6
    if-ge v4, v2, :cond_8

    .line 369
    .line 370
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v9

    .line 374
    add-int/lit8 v4, v4, 0x1

    .line 375
    .line 376
    check-cast v9, Lmh;

    .line 377
    .line 378
    iget-object v9, v9, Lmh;->a:Ljava/lang/String;

    .line 379
    .line 380
    goto :goto_6

    .line 381
    :cond_8
    new-instance v2, Ls7;

    .line 382
    .line 383
    const/16 v4, 0x12

    .line 384
    .line 385
    invoke-direct {v2, v4, v14}, Ls7;-><init>(ILjava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    :try_start_0
    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    invoke-virtual/range {v20 .. v20}, Lpd0;->d()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v25

    .line 396
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 397
    .line 398
    .line 399
    move-result-object v9

    .line 400
    const/4 v11, 0x0

    .line 401
    invoke-virtual {v9, v4, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 402
    .line 403
    .line 404
    move-result-object v9

    .line 405
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 406
    .line 407
    const/16 v13, 0x1c

    .line 408
    .line 409
    if-lt v12, v13, :cond_9

    .line 410
    .line 411
    invoke-static {v9}, Ld1;->d(Landroid/content/pm/PackageInfo;)J

    .line 412
    .line 413
    .line 414
    move-result-wide v15

    .line 415
    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v12

    .line 419
    :goto_7
    move-object/from16 v27, v12

    .line 420
    .line 421
    goto :goto_8

    .line 422
    :cond_9
    iget v12, v9, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 423
    .line 424
    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v12

    .line 428
    goto :goto_7

    .line 429
    :goto_8
    iget-object v9, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 430
    .line 431
    if-nez v9, :cond_a

    .line 432
    .line 433
    const-string v9, "0.0"

    .line 434
    .line 435
    :cond_a
    move-object/from16 v28, v9

    .line 436
    .line 437
    new-instance v32, Ldn;

    .line 438
    .line 439
    move-object/from16 v29, v2

    .line 440
    .line 441
    move-object/from16 v26, v4

    .line 442
    .line 443
    move-object/from16 v24, v8

    .line 444
    .line 445
    move-object/from16 v21, v32

    .line 446
    .line 447
    invoke-direct/range {v21 .. v29}, Ldn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_5

    .line 448
    .line 449
    .line 450
    move-object/from16 v4, v21

    .line 451
    .line 452
    move-object/from16 v2, v22

    .line 453
    .line 454
    move-object/from16 v12, v27

    .line 455
    .line 456
    move-object/from16 v9, v28

    .line 457
    .line 458
    new-instance v8, Ltb0;

    .line 459
    .line 460
    const/16 v15, 0x10

    .line 461
    .line 462
    invoke-direct {v8, v15}, Ltb0;-><init>(I)V

    .line 463
    .line 464
    .line 465
    invoke-virtual/range {v20 .. v20}, Lpd0;->d()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v8

    .line 469
    new-instance v15, Lmz;

    .line 470
    .line 471
    const/16 v11, 0x16

    .line 472
    .line 473
    invoke-direct {v15, v11}, Lmz;-><init>(I)V

    .line 474
    .line 475
    .line 476
    move v11, v13

    .line 477
    new-instance v13, Lny0;

    .line 478
    .line 479
    move-object/from16 v25, v7

    .line 480
    .line 481
    const/4 v7, 0x5

    .line 482
    invoke-direct {v13, v7, v15}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 483
    .line 484
    .line 485
    new-instance v11, Lbv1;

    .line 486
    .line 487
    invoke-direct {v11, v10}, Lbv1;-><init>(Lm30;)V

    .line 488
    .line 489
    .line 490
    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 491
    .line 492
    const-string v10, "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/"

    .line 493
    .line 494
    const-string v7, "/settings"

    .line 495
    .line 496
    invoke-static {v10, v2, v7}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v7

    .line 500
    new-instance v10, Ldb2;

    .line 501
    .line 502
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 503
    .line 504
    .line 505
    iput-object v7, v10, Ldb2;->j:Ljava/lang/String;

    .line 506
    .line 507
    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 508
    .line 509
    move-object/from16 v16, v8

    .line 510
    .line 511
    sget-object v8, Lpd0;->h:Ljava/lang/String;

    .line 512
    .line 513
    move-object/from16 v28, v10

    .line 514
    .line 515
    const-string v10, ""

    .line 516
    .line 517
    invoke-virtual {v7, v8, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v7

    .line 521
    sget-object v10, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 522
    .line 523
    move-object/from16 v29, v11

    .line 524
    .line 525
    const-string v11, ""

    .line 526
    .line 527
    invoke-virtual {v10, v8, v11}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v10

    .line 531
    new-instance v11, Ljava/lang/StringBuilder;

    .line 532
    .line 533
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 534
    .line 535
    .line 536
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    const-string v7, "/"

    .line 540
    .line 541
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v17

    .line 551
    sget-object v7, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    .line 552
    .line 553
    const-string v10, ""

    .line 554
    .line 555
    invoke-virtual {v7, v8, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v18

    .line 559
    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 560
    .line 561
    const-string v10, ""

    .line 562
    .line 563
    invoke-virtual {v7, v8, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object v19

    .line 567
    const-string v7, "com.google.firebase.crashlytics.mapping_file_id"

    .line 568
    .line 569
    const-string v8, "string"

    .line 570
    .line 571
    invoke-static {v14, v7, v8}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    .line 573
    .line 574
    move-result v7

    .line 575
    if-nez v7, :cond_b

    .line 576
    .line 577
    const-string v7, "com.crashlytics.android.build_id"

    .line 578
    .line 579
    invoke-static {v14, v7, v8}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 580
    .line 581
    .line 582
    move-result v7

    .line 583
    :cond_b
    if-eqz v7, :cond_c

    .line 584
    .line 585
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 586
    .line 587
    .line 588
    move-result-object v8

    .line 589
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object v7

    .line 593
    goto :goto_9

    .line 594
    :cond_c
    const/4 v7, 0x0

    .line 595
    :goto_9
    filled-new-array {v7, v2, v9, v12}, [Ljava/lang/String;

    .line 596
    .line 597
    .line 598
    move-result-object v7

    .line 599
    new-instance v8, Ljava/util/ArrayList;

    .line 600
    .line 601
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 602
    .line 603
    .line 604
    const/4 v10, 0x0

    .line 605
    :goto_a
    const/4 v11, 0x4

    .line 606
    if-ge v10, v11, :cond_e

    .line 607
    .line 608
    aget-object v11, v7, v10

    .line 609
    .line 610
    move-object/from16 v22, v2

    .line 611
    .line 612
    if-eqz v11, :cond_d

    .line 613
    .line 614
    const-string v2, "-"

    .line 615
    .line 616
    invoke-virtual {v11, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v2

    .line 620
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 621
    .line 622
    invoke-virtual {v2, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 627
    .line 628
    .line 629
    :cond_d
    add-int/lit8 v10, v10, 0x1

    .line 630
    .line 631
    move-object/from16 v2, v22

    .line 632
    .line 633
    goto :goto_a

    .line 634
    :cond_e
    move-object/from16 v22, v2

    .line 635
    .line 636
    invoke-static {v8}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 637
    .line 638
    .line 639
    new-instance v2, Ljava/lang/StringBuilder;

    .line 640
    .line 641
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 642
    .line 643
    .line 644
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 645
    .line 646
    .line 647
    move-result v7

    .line 648
    const/4 v10, 0x0

    .line 649
    :goto_b
    if-ge v10, v7, :cond_f

    .line 650
    .line 651
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v21

    .line 655
    add-int/lit8 v10, v10, 0x1

    .line 656
    .line 657
    move-object/from16 v11, v21

    .line 658
    .line 659
    check-cast v11, Ljava/lang/String;

    .line 660
    .line 661
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 662
    .line 663
    .line 664
    const/4 v11, 0x4

    .line 665
    goto :goto_b

    .line 666
    :cond_f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v2

    .line 670
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 671
    .line 672
    .line 673
    move-result v7

    .line 674
    if-lez v7, :cond_10

    .line 675
    .line 676
    invoke-static {v2}, Lml;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    move-object/from16 v21, v2

    .line 681
    .line 682
    goto :goto_c

    .line 683
    :cond_10
    const/16 v21, 0x0

    .line 684
    .line 685
    :goto_c
    if-eqz v16, :cond_11

    .line 686
    .line 687
    const/16 v23, 0x4

    .line 688
    .line 689
    goto :goto_d

    .line 690
    :cond_11
    const/16 v23, 0x1

    .line 691
    .line 692
    :goto_d
    invoke-static/range {v23 .. v23}, Loq;->b(I)I

    .line 693
    .line 694
    .line 695
    move-result v24

    .line 696
    new-instance v11, Lo61;

    .line 697
    .line 698
    move-object/from16 v23, v12

    .line 699
    .line 700
    move-object v12, v15

    .line 701
    move-object/from16 v16, v22

    .line 702
    .line 703
    const/4 v2, 0x0

    .line 704
    move-object/from16 v22, v9

    .line 705
    .line 706
    move-object v15, v11

    .line 707
    invoke-direct/range {v15 .. v24}, Lo61;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpd0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 708
    .line 709
    .line 710
    new-instance v36, Ldn;

    .line 711
    .line 712
    move-object v10, v14

    .line 713
    move-object/from16 v16, v25

    .line 714
    .line 715
    move-object/from16 v15, v28

    .line 716
    .line 717
    move-object/from16 v14, v29

    .line 718
    .line 719
    move-object/from16 v9, v36

    .line 720
    .line 721
    const/16 v7, 0x1c

    .line 722
    .line 723
    const/4 v8, 0x0

    .line 724
    invoke-direct/range {v9 .. v16}, Ldn;-><init>(Landroid/content/Context;Lo61;Lmz;Lny0;Lbv1;Ldb2;Lqt;)V

    .line 725
    .line 726
    .line 727
    iget-object v10, v9, Ldn;->h:Ljava/lang/Object;

    .line 728
    .line 729
    check-cast v10, Ljava/util/concurrent/atomic/AtomicReference;

    .line 730
    .line 731
    iget-object v11, v9, Ldn;->g:Ljava/lang/Object;

    .line 732
    .line 733
    check-cast v11, Ljava/util/concurrent/atomic/AtomicReference;

    .line 734
    .line 735
    iget-object v12, v9, Ldn;->a:Ljava/lang/Object;

    .line 736
    .line 737
    check-cast v12, Landroid/content/Context;

    .line 738
    .line 739
    const-string v13, "com.google.firebase.crashlytics"

    .line 740
    .line 741
    invoke-virtual {v12, v13, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 742
    .line 743
    .line 744
    move-result-object v12

    .line 745
    const-string v13, "existing_instance_identifier"

    .line 746
    .line 747
    invoke-interface {v12, v13, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 748
    .line 749
    .line 750
    move-result-object v1

    .line 751
    iget-object v12, v9, Ldn;->b:Ljava/lang/Object;

    .line 752
    .line 753
    check-cast v12, Lo61;

    .line 754
    .line 755
    iget-object v12, v12, Lo61;->f:Ljava/lang/String;

    .line 756
    .line 757
    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 758
    .line 759
    .line 760
    move-result v1

    .line 761
    if-eqz v1, :cond_12

    .line 762
    .line 763
    const/4 v1, 0x1

    .line 764
    invoke-virtual {v9, v1}, Ldn;->e(I)Lp51;

    .line 765
    .line 766
    .line 767
    move-result-object v12

    .line 768
    if-eqz v12, :cond_12

    .line 769
    .line 770
    invoke-virtual {v11, v12}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 774
    .line 775
    .line 776
    move-result-object v1

    .line 777
    check-cast v1, Llb1;

    .line 778
    .line 779
    invoke-virtual {v1, v12}, Llb1;->b(Ljava/lang/Object;)V

    .line 780
    .line 781
    .line 782
    invoke-static {v2}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 783
    .line 784
    .line 785
    move-result-object v1

    .line 786
    goto :goto_e

    .line 787
    :cond_12
    const/4 v1, 0x3

    .line 788
    invoke-virtual {v9, v1}, Ldn;->e(I)Lp51;

    .line 789
    .line 790
    .line 791
    move-result-object v1

    .line 792
    if-eqz v1, :cond_13

    .line 793
    .line 794
    invoke-virtual {v11, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 795
    .line 796
    .line 797
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 798
    .line 799
    .line 800
    move-result-object v10

    .line 801
    check-cast v10, Llb1;

    .line 802
    .line 803
    invoke-virtual {v10, v1}, Llb1;->b(Ljava/lang/Object;)V

    .line 804
    .line 805
    .line 806
    :cond_13
    iget-object v1, v9, Ldn;->f:Ljava/lang/Object;

    .line 807
    .line 808
    check-cast v1, Lqt;

    .line 809
    .line 810
    iget-object v10, v1, Lqt;->f:Ljava/lang/Object;

    .line 811
    .line 812
    check-cast v10, Llb1;

    .line 813
    .line 814
    iget-object v10, v10, Llb1;->a:Ljd2;

    .line 815
    .line 816
    iget-object v11, v1, Lqt;->d:Ljava/lang/Object;

    .line 817
    .line 818
    monitor-enter v11

    .line 819
    :try_start_1
    iget-object v1, v1, Lqt;->e:Ljava/lang/Object;

    .line 820
    .line 821
    check-cast v1, Llb1;

    .line 822
    .line 823
    iget-object v1, v1, Llb1;->a:Ljd2;

    .line 824
    .line 825
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 826
    invoke-static {v10, v1}, Les0;->m(Ljd2;Ljd2;)Ljd2;

    .line 827
    .line 828
    .line 829
    move-result-object v1

    .line 830
    iget-object v10, v3, Lc9;->k:Ljava/lang/Object;

    .line 831
    .line 832
    check-cast v10, Lzs;

    .line 833
    .line 834
    new-instance v11, Lxn0;

    .line 835
    .line 836
    const/16 v12, 0xd

    .line 837
    .line 838
    invoke-direct {v11, v9, v3, v12, v8}, Lxn0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 839
    .line 840
    .line 841
    invoke-virtual {v1, v10, v11}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 842
    .line 843
    .line 844
    move-result-object v1

    .line 845
    :goto_e
    new-instance v3, Lz0;

    .line 846
    .line 847
    invoke-direct {v3, v7}, Lz0;-><init>(I)V

    .line 848
    .line 849
    .line 850
    invoke-virtual {v1, v0, v3}, Ljd2;->c(Ljava/util/concurrent/Executor;Lyr0;)V

    .line 851
    .line 852
    .line 853
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 854
    .line 855
    iget-object v1, v5, Lsr;->i:Lm30;

    .line 856
    .line 857
    iget-object v3, v5, Lsr;->a:Landroid/content/Context;

    .line 858
    .line 859
    const-string v7, "com.crashlytics.RequireBuildId"

    .line 860
    .line 861
    if-eqz v3, :cond_15

    .line 862
    .line 863
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 864
    .line 865
    .line 866
    move-result-object v10

    .line 867
    if-eqz v10, :cond_15

    .line 868
    .line 869
    const-string v11, "bool"

    .line 870
    .line 871
    invoke-static {v3, v7, v11}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    .line 873
    .line 874
    move-result v11

    .line 875
    if-lez v11, :cond_14

    .line 876
    .line 877
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 878
    .line 879
    .line 880
    move-result v7

    .line 881
    goto :goto_f

    .line 882
    :cond_14
    const-string v10, "string"

    .line 883
    .line 884
    invoke-static {v3, v7, v10}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    .line 886
    .line 887
    move-result v7

    .line 888
    if-lez v7, :cond_15

    .line 889
    .line 890
    invoke-virtual {v3, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object v7

    .line 894
    invoke-static {v7}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 895
    .line 896
    .line 897
    move-result v7

    .line 898
    goto :goto_f

    .line 899
    :cond_15
    const/4 v7, 0x1

    .line 900
    :goto_f
    iget-object v10, v4, Ldn;->b:Ljava/lang/Object;

    .line 901
    .line 902
    check-cast v10, Ljava/lang/String;

    .line 903
    .line 904
    if-nez v7, :cond_16

    .line 905
    .line 906
    goto :goto_10

    .line 907
    :cond_16
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 908
    .line 909
    .line 910
    move-result v7

    .line 911
    if-nez v7, :cond_19

    .line 912
    .line 913
    :goto_10
    new-instance v7, Lvh;

    .line 914
    .line 915
    invoke-direct {v7}, Lvh;-><init>()V

    .line 916
    .line 917
    .line 918
    iget-object v7, v7, Lvh;->a:Ljava/lang/String;

    .line 919
    .line 920
    :try_start_2
    new-instance v10, Ls7;

    .line 921
    .line 922
    const-string v11, "crash_marker"

    .line 923
    .line 924
    const/16 v12, 0xe

    .line 925
    .line 926
    invoke-direct {v10, v11, v1, v12, v8}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 927
    .line 928
    .line 929
    iput-object v10, v5, Lsr;->f:Ls7;

    .line 930
    .line 931
    new-instance v10, Ls7;

    .line 932
    .line 933
    const-string v11, "initialization_marker"

    .line 934
    .line 935
    invoke-direct {v10, v11, v1, v12, v8}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 936
    .line 937
    .line 938
    iput-object v10, v5, Lsr;->e:Ls7;

    .line 939
    .line 940
    new-instance v10, Lnm;

    .line 941
    .line 942
    invoke-direct {v10, v7, v1, v6}, Lnm;-><init>(Ljava/lang/String;Lm30;Lc9;)V

    .line 943
    .line 944
    .line 945
    new-instance v11, Ls7;

    .line 946
    .line 947
    invoke-direct {v11, v1}, Ls7;-><init>(Lm30;)V

    .line 948
    .line 949
    .line 950
    new-instance v1, Lxn0;

    .line 951
    .line 952
    new-instance v12, Lmz;

    .line 953
    .line 954
    const/16 v13, 0x14

    .line 955
    .line 956
    invoke-direct {v12, v13}, Lmz;-><init>(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 957
    .line 958
    .line 959
    const/4 v13, 0x1

    .line 960
    :try_start_3
    new-array v14, v13, [Lf91;

    .line 961
    .line 962
    aput-object v12, v14, v8
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 963
    .line 964
    :try_start_4
    invoke-direct {v1, v14}, Lxn0;-><init>([Lf91;)V

    .line 965
    .line 966
    .line 967
    iget-object v12, v5, Lsr;->n:Lny0;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 968
    .line 969
    :try_start_5
    new-instance v13, Lur;

    .line 970
    .line 971
    invoke-direct {v13, v10}, Lur;-><init>(Lnm;)V

    .line 972
    .line 973
    .line 974
    iget-object v12, v12, Lny0;->k:Ljava/lang/Object;

    .line 975
    .line 976
    check-cast v12, Lis0;

    .line 977
    .line 978
    new-instance v14, Lfj;

    .line 979
    .line 980
    const/16 v15, 0x8

    .line 981
    .line 982
    invoke-direct {v14, v15, v13}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 983
    .line 984
    .line 985
    invoke-virtual {v12, v14}, Lis0;->a(Llw;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 986
    .line 987
    .line 988
    :try_start_6
    iget-object v12, v5, Lsr;->a:Landroid/content/Context;

    .line 989
    .line 990
    iget-object v13, v5, Lsr;->h:Lpd0;

    .line 991
    .line 992
    iget-object v14, v5, Lsr;->i:Lm30;

    .line 993
    .line 994
    iget-object v15, v5, Lsr;->c:Lxn0;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 995
    .line 996
    :try_start_7
    iget-object v2, v5, Lsr;->l:Llr;

    .line 997
    .line 998
    iget-object v8, v5, Lsr;->o:Lc9;

    .line 999
    .line 1000
    move-object/from16 v35, v1

    .line 1001
    .line 1002
    move-object/from16 v38, v2

    .line 1003
    .line 1004
    move-object/from16 v32, v4

    .line 1005
    .line 1006
    move-object/from16 v39, v8

    .line 1007
    .line 1008
    move-object/from16 v36, v9

    .line 1009
    .line 1010
    move-object/from16 v34, v10

    .line 1011
    .line 1012
    move-object/from16 v33, v11

    .line 1013
    .line 1014
    move-object/from16 v29, v12

    .line 1015
    .line 1016
    move-object/from16 v30, v13

    .line 1017
    .line 1018
    move-object/from16 v31, v14

    .line 1019
    .line 1020
    move-object/from16 v37, v15

    .line 1021
    .line 1022
    invoke-static/range {v29 .. v39}, Li7;->l(Landroid/content/Context;Lpd0;Lm30;Ldn;Ls7;Lnm;Lxn0;Ldn;Lxn0;Llr;Lc9;)Li7;

    .line 1023
    .line 1024
    .line 1025
    move-result-object v38

    .line 1026
    move-object/from16 v9, v36

    .line 1027
    .line 1028
    new-instance v29, Lor;

    .line 1029
    .line 1030
    iget-object v1, v5, Lsr;->a:Landroid/content/Context;

    .line 1031
    .line 1032
    iget-object v2, v5, Lsr;->h:Lpd0;

    .line 1033
    .line 1034
    iget-object v4, v5, Lsr;->b:Lqt;

    .line 1035
    .line 1036
    iget-object v8, v5, Lsr;->i:Lm30;

    .line 1037
    .line 1038
    iget-object v10, v5, Lsr;->f:Ls7;

    .line 1039
    .line 1040
    iget-object v11, v5, Lsr;->m:Ltr;

    .line 1041
    .line 1042
    iget-object v12, v5, Lsr;->k:Ll4;

    .line 1043
    .line 1044
    iget-object v13, v5, Lsr;->l:Llr;

    .line 1045
    .line 1046
    iget-object v14, v5, Lsr;->o:Lc9;

    .line 1047
    .line 1048
    move-object/from16 v30, v1

    .line 1049
    .line 1050
    move-object/from16 v31, v2

    .line 1051
    .line 1052
    move-object/from16 v39, v11

    .line 1053
    .line 1054
    move-object/from16 v40, v12

    .line 1055
    .line 1056
    move-object/from16 v41, v13

    .line 1057
    .line 1058
    move-object/from16 v42, v14

    .line 1059
    .line 1060
    move-object/from16 v35, v32

    .line 1061
    .line 1062
    move-object/from16 v37, v33

    .line 1063
    .line 1064
    move-object/from16 v36, v34

    .line 1065
    .line 1066
    move-object/from16 v32, v4

    .line 1067
    .line 1068
    move-object/from16 v33, v8

    .line 1069
    .line 1070
    move-object/from16 v34, v10

    .line 1071
    .line 1072
    invoke-direct/range {v29 .. v42}, Lor;-><init>(Landroid/content/Context;Lpd0;Lqt;Lm30;Ls7;Ldn;Lnm;Ls7;Li7;Ltr;Ll4;Llr;Lc9;)V

    .line 1073
    .line 1074
    .line 1075
    move-object/from16 v1, v29

    .line 1076
    .line 1077
    iput-object v1, v5, Lsr;->g:Lor;

    .line 1078
    .line 1079
    iget-object v1, v5, Lsr;->e:Ls7;

    .line 1080
    .line 1081
    iget-object v2, v1, Ls7;->l:Ljava/lang/Object;

    .line 1082
    .line 1083
    check-cast v2, Lm30;

    .line 1084
    .line 1085
    iget-object v1, v1, Ls7;->k:Ljava/lang/Object;

    .line 1086
    .line 1087
    check-cast v1, Ljava/lang/String;

    .line 1088
    .line 1089
    new-instance v4, Ljava/io/File;

    .line 1090
    .line 1091
    iget-object v2, v2, Lm30;->l:Ljava/lang/Object;

    .line 1092
    .line 1093
    check-cast v2, Ljava/io/File;

    .line 1094
    .line 1095
    invoke-direct {v4, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1096
    .line 1097
    .line 1098
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 1099
    .line 1100
    .line 1101
    move-result v1

    .line 1102
    iget-object v2, v6, Lc9;->k:Ljava/lang/Object;

    .line 1103
    .line 1104
    check-cast v2, Lzs;

    .line 1105
    .line 1106
    iget-object v2, v2, Lzs;->j:Ljava/util/concurrent/ExecutorService;

    .line 1107
    .line 1108
    new-instance v4, Lvm;

    .line 1109
    .line 1110
    const/4 v13, 0x1

    .line 1111
    invoke-direct {v4, v13, v5}, Lvm;-><init>(ILjava/lang/Object;)V

    .line 1112
    .line 1113
    .line 1114
    invoke-interface {v2, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v2
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 1118
    const-wide/16 v10, 0x3

    .line 1119
    .line 1120
    :try_start_8
    invoke-interface {v2, v10, v11, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v2

    .line 1124
    check-cast v2, Ljava/lang/Boolean;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 1125
    .line 1126
    :try_start_9
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1127
    .line 1128
    invoke-virtual {v4, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 1129
    .line 1130
    .line 1131
    :catch_0
    iget-object v2, v5, Lsr;->g:Lor;

    .line 1132
    .line 1133
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 1134
    .line 1135
    .line 1136
    move-result-object v4

    .line 1137
    iget-object v8, v2, Lor;->e:Lc9;

    .line 1138
    .line 1139
    iget-object v8, v8, Lc9;->k:Ljava/lang/Object;

    .line 1140
    .line 1141
    check-cast v8, Lzs;

    .line 1142
    .line 1143
    new-instance v12, Lo6;

    .line 1144
    .line 1145
    const/4 v13, 0x5

    .line 1146
    invoke-direct {v12, v2, v13, v7}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 1147
    .line 1148
    .line 1149
    invoke-virtual {v8, v12}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;

    .line 1150
    .line 1151
    .line 1152
    new-instance v7, Lpa0;

    .line 1153
    .line 1154
    const/16 v8, 0xb

    .line 1155
    .line 1156
    invoke-direct {v7, v8, v2}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 1157
    .line 1158
    .line 1159
    new-instance v8, Lys;

    .line 1160
    .line 1161
    iget-object v12, v2, Lor;->j:Ltr;

    .line 1162
    .line 1163
    invoke-direct {v8, v7, v9, v4, v12}, Lys;-><init>(Lpa0;Ldn;Ljava/lang/Thread$UncaughtExceptionHandler;Ltr;)V

    .line 1164
    .line 1165
    .line 1166
    iput-object v8, v2, Lor;->n:Lys;

    .line 1167
    .line 1168
    invoke-static {v8}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 1169
    .line 1170
    .line 1171
    if-eqz v1, :cond_18

    .line 1172
    .line 1173
    const-string v1, "android.permission.ACCESS_NETWORK_STATE"

    .line 1174
    .line 1175
    invoke-virtual {v3, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 1176
    .line 1177
    .line 1178
    move-result v1

    .line 1179
    if-nez v1, :cond_17

    .line 1180
    .line 1181
    const-string v1, "connectivity"

    .line 1182
    .line 1183
    invoke-virtual {v3, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 1184
    .line 1185
    .line 1186
    move-result-object v1

    .line 1187
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 1188
    .line 1189
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v1

    .line 1193
    if-eqz v1, :cond_18

    .line 1194
    .line 1195
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    .line 1196
    .line 1197
    .line 1198
    move-result v1

    .line 1199
    if-eqz v1, :cond_18

    .line 1200
    .line 1201
    :cond_17
    iget-object v1, v6, Lc9;->k:Ljava/lang/Object;

    .line 1202
    .line 1203
    check-cast v1, Lzs;

    .line 1204
    .line 1205
    iget-object v1, v1, Lzs;->j:Ljava/util/concurrent/ExecutorService;

    .line 1206
    .line 1207
    new-instance v2, Lpr;

    .line 1208
    .line 1209
    const/4 v13, 0x1

    .line 1210
    invoke-direct {v2, v5, v9, v13}, Lpr;-><init>(Lsr;Ldn;I)V

    .line 1211
    .line 1212
    .line 1213
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 1217
    :try_start_a
    invoke-interface {v1, v10, v11, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 1218
    .line 1219
    .line 1220
    goto :goto_12

    .line 1221
    :catch_1
    :try_start_b
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 1222
    .line 1223
    .line 1224
    move-result-object v0

    .line 1225
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    .line 1226
    .line 1227
    .line 1228
    goto :goto_12

    .line 1229
    :catch_2
    const/4 v2, 0x0

    .line 1230
    goto :goto_11

    .line 1231
    :cond_18
    iget-object v0, v6, Lc9;->k:Ljava/lang/Object;

    .line 1232
    .line 1233
    check-cast v0, Lzs;

    .line 1234
    .line 1235
    new-instance v1, Lpr;

    .line 1236
    .line 1237
    const/4 v8, 0x0

    .line 1238
    invoke-direct {v1, v5, v9, v8}, Lpr;-><init>(Lsr;Ldn;I)V

    .line 1239
    .line 1240
    .line 1241
    invoke-virtual {v0, v1}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;

    .line 1242
    .line 1243
    .line 1244
    goto :goto_12

    .line 1245
    :catch_3
    :goto_11
    iput-object v2, v5, Lsr;->g:Lor;

    .line 1246
    .line 1247
    :catch_4
    :goto_12
    new-instance v15, Lv30;

    .line 1248
    .line 1249
    invoke-direct {v15, v5}, Lv30;-><init>(Lsr;)V

    .line 1250
    .line 1251
    .line 1252
    goto :goto_13

    .line 1253
    :cond_19
    const-string v0, "The Crashlytics build ID is missing. This occurs when the Crashlytics Gradle plugin is missing from your app\'s build configuration. Please review the Firebase Crashlytics onboarding instructions at https://firebase.google.com/docs/crashlytics/get-started?platform=android#add-plugin"

    .line 1254
    .line 1255
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 1256
    .line 1257
    .line 1258
    return-object v2

    .line 1259
    :catchall_0
    move-exception v0

    .line 1260
    :try_start_c
    monitor-exit v11
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 1261
    throw v0

    .line 1262
    :catch_5
    const/4 v2, 0x0

    .line 1263
    move-object v15, v2

    .line 1264
    :goto_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 1265
    .line 1266
    .line 1267
    return-object v15
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 0

    .line 1
    iget-object p0, p0, Lfj;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcn;

    .line 4
    .line 5
    check-cast p1, Lzm;

    .line 6
    .line 7
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
