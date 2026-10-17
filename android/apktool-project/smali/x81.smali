.class public abstract synthetic Lx81;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static final a(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x2

    .line 6
    if-eqz p1, :cond_6

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq p1, v1, :cond_4

    .line 10
    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    if-eq p1, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {v0}, Lz70;->F(I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    :cond_1
    const/4 p1, 0x4

    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    invoke-static {v0}, Lz70;->F(I)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    :cond_3
    const/16 p1, 0x8

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_4
    invoke-static {v0}, Lz70;->F(I)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_5

    .line 51
    .line 52
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    :cond_5
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Landroid/view/ViewGroup;

    .line 65
    .line 66
    if-eqz p1, :cond_8

    .line 67
    .line 68
    invoke-static {v0}, Lz70;->F(I)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_7

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    :cond_7
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    :cond_8
    :goto_0
    return-void
.end method

.method public static b(I)I
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x3

    .line 11
    return p0

    .line 12
    :cond_0
    const-string v0, "Unknown visibility "

    .line 13
    .line 14
    invoke-static {p0, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    return v0

    .line 24
    :cond_2
    const/4 p0, 0x2

    .line 25
    return p0
.end method

.method public static c(Landroid/view/View;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x4

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Lx81;->b(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static synthetic d(Ljava/lang/Object;)I
    .locals 2

    .line 1
    instance-of v0, p0, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    instance-of v0, p0, Ljava/lang/Long;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const/4 p0, 0x3

    .line 18
    return p0

    .line 19
    :cond_2
    instance-of v0, p0, Ljava/lang/Double;

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    return p0

    .line 25
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "invalid tag type: "

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    throw v0
.end method

.method public static e(I)I
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    packed-switch p0, :pswitch_data_1

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :pswitch_0
    const/16 p0, 0xc

    .line 10
    .line 11
    return p0

    .line 12
    :pswitch_1
    const/16 p0, 0xb

    .line 13
    .line 14
    return p0

    .line 15
    :pswitch_2
    const/16 p0, 0xa

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_3
    const/16 p0, 0x9

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_4
    const/16 p0, 0x8

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_5
    const/4 p0, 0x7

    .line 25
    return p0

    .line 26
    :pswitch_6
    const/4 p0, 0x6

    .line 27
    return p0

    .line 28
    :pswitch_7
    const/4 p0, 0x5

    .line 29
    return p0

    .line 30
    :pswitch_8
    const/4 p0, 0x4

    .line 31
    return p0

    .line 32
    :pswitch_9
    const/4 p0, 0x3

    .line 33
    return p0

    .line 34
    :pswitch_a
    const/4 p0, 0x2

    .line 35
    return p0

    .line 36
    :pswitch_b
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic f(I)J
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p0, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    if-ne p0, v0, :cond_0

    .line 15
    .line 16
    const-wide/16 v0, 0x1

    .line 17
    .line 18
    return-wide v0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    throw p0

    .line 21
    :cond_1
    const-wide/16 v0, 0x400

    .line 22
    .line 23
    return-wide v0

    .line 24
    :cond_2
    const-wide/32 v0, 0x100000

    .line 25
    .line 26
    .line 27
    return-wide v0

    .line 28
    :cond_3
    const-wide/32 v0, 0x40000000

    .line 29
    .line 30
    .line 31
    return-wide v0

    .line 32
    :cond_4
    const-wide v0, 0x10000000000L

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    return-wide v0
.end method

.method public static synthetic g(I)I
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    throw p0

    .line 6
    :pswitch_0
    const/16 p0, 0x16

    .line 7
    .line 8
    return p0

    .line 9
    :pswitch_1
    const/16 p0, 0x15

    .line 10
    .line 11
    return p0

    .line 12
    :pswitch_2
    const/16 p0, 0x14

    .line 13
    .line 14
    return p0

    .line 15
    :pswitch_3
    const/16 p0, 0x8

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_4
    const/4 p0, 0x7

    .line 19
    return p0

    .line 20
    :pswitch_5
    const/4 p0, 0x6

    .line 21
    return p0

    .line 22
    :pswitch_6
    const/4 p0, 0x5

    .line 23
    return p0

    .line 24
    :pswitch_7
    const/4 p0, 0x4

    .line 25
    return p0

    .line 26
    :pswitch_8
    const/4 p0, 0x3

    .line 27
    return p0

    .line 28
    :pswitch_9
    const/4 p0, 0x2

    .line 29
    return p0

    .line 30
    :pswitch_a
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :pswitch_b
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static h(III)I
    .locals 0

    .line 1
    invoke-static {p0}, Lfp1;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/2addr p0, p1

    .line 6
    add-int/2addr p0, p2

    .line 7
    return p0
.end method

.method public static i(IIII)I
    .locals 0

    .line 1
    invoke-static {p0}, Lfp1;->a(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/2addr p0, p1

    .line 6
    add-int/2addr p0, p2

    .line 7
    add-int/2addr p0, p3

    .line 8
    return p0
.end method

.method public static j(Ljava/lang/StringBuilder;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static k(Lyp1;)Lyp1;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/2addr v0, v0

    .line 6
    invoke-interface {p0, v0}, Lyp1;->l(I)Lyp1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic l(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    throw p0

    .line 6
    :pswitch_0
    const-string p0, "MISSING_SGTM_SERVER_URL"

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    const-string p0, "PINNED_TO_SERVICE_UPLOAD"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-string p0, "SERVICE_FLAG_OFF"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-string p0, "CLIENT_FLAG_OFF"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-string p0, "NOT_ENABLED_IN_MANIFEST"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-string p0, "MISSING_JOB_SCHEDULER"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-string p0, "SDK_TOO_OLD"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_7
    const-string p0, "NON_PLAY_MODE"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_8
    const-string p0, "ANDROID_TOO_OLD"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_9
    const-string p0, "MEASUREMENT_SERVICE_NOT_ENABLED"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_a
    const-string p0, "CLIENT_UPLOAD_ELIGIBLE"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_b
    const-string p0, "CLIENT_UPLOAD_ELIGIBILITY_UNKNOWN"

    .line 40
    .line 41
    return-object p0

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
