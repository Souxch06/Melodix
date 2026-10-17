.class public final Lld1;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CLIENT_START_TIME_US_FIELD_NUMBER:I = 0x4

.field public static final COUNTERS_FIELD_NUMBER:I = 0x6

.field public static final CUSTOM_ATTRIBUTES_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lld1;

.field public static final DURATION_US_FIELD_NUMBER:I = 0x5

.field public static final IS_AUTO_FIELD_NUMBER:I = 0x2

.field public static final NAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final PERF_SESSIONS_FIELD_NUMBER:I = 0x9

.field public static final SUBTRACES_FIELD_NUMBER:I = 0x7


# instance fields
.field private bitField0_:I

.field private clientStartTimeUs_:J

.field private counters_:Lml0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lml0;"
        }
    .end annotation
.end field

.field private customAttributes_:Lml0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lml0;"
        }
    .end annotation
.end field

.field private durationUs_:J

.field private isAuto_:Z

.field private name_:Ljava/lang/String;

.field private perfSessions_:Lif0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lif0;"
        }
    .end annotation
.end field

.field private subtraces_:Lif0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lif0;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lld1;

    .line 2
    .line 3
    invoke-direct {v0}, Lld1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 7
    .line 8
    const-class v1, Lld1;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lia0;->p(Ljava/lang/Class;Lia0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lia0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lml0;->k:Lml0;

    .line 5
    .line 6
    iput-object v0, p0, Lld1;->counters_:Lml0;

    .line 7
    .line 8
    iput-object v0, p0, Lld1;->customAttributes_:Lml0;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lld1;->name_:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v0, Lew0;->m:Lew0;

    .line 15
    .line 16
    iput-object v0, p0, Lld1;->subtraces_:Lif0;

    .line 17
    .line 18
    iput-object v0, p0, Lld1;->perfSessions_:Lif0;

    .line 19
    .line 20
    return-void
.end method

.method public static H()Lid1;
    .locals 1

    .line 1
    sget-object v0, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lid1;

    .line 8
    .line 9
    return-object v0
.end method

.method public static z()Lld1;
    .locals 1

    .line 1
    sget-object v0, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final A()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lld1;->durationUs_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final B()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C()Lif0;
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->perfSessions_:Lif0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final D()Lif0;
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->subtraces_:Lif0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E()Z
    .locals 0

    .line 1
    iget p0, p0, Lld1;->bitField0_:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x4

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final F()Lml0;
    .locals 2

    .line 1
    iget-object v0, p0, Lld1;->counters_:Lml0;

    .line 2
    .line 3
    iget-boolean v1, v0, Lml0;->j:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lml0;->c()Lml0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lld1;->counters_:Lml0;

    .line 12
    .line 13
    :cond_0
    return-object v0
.end method

.method public final G()Lml0;
    .locals 2

    .line 1
    iget-object v0, p0, Lld1;->customAttributes_:Lml0;

    .line 2
    .line 3
    iget-boolean v1, v0, Lml0;->j:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lml0;->c()Lml0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lld1;->customAttributes_:Lml0;

    .line 12
    .line 13
    :cond_0
    return-object v0
.end method

.method public final I(J)V
    .locals 1

    .line 1
    iget v0, p0, Lld1;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, Lld1;->bitField0_:I

    .line 6
    .line 7
    iput-wide p1, p0, Lld1;->clientStartTimeUs_:J

    .line 8
    .line 9
    return-void
.end method

.method public final J(J)V
    .locals 1

    .line 1
    iget v0, p0, Lld1;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    iput v0, p0, Lld1;->bitField0_:I

    .line 6
    .line 7
    iput-wide p1, p0, Lld1;->durationUs_:J

    .line 8
    .line 9
    return-void
.end method

.method public final K(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lld1;->bitField0_:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Lld1;->bitField0_:I

    .line 9
    .line 10
    iput-object p1, p0, Lld1;->name_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public final j(I)Ljava/lang/Object;
    .locals 13

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    packed-switch p0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lo40;->c()V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :pswitch_0
    sget-object p0, Lld1;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Lld1;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Lld1;->PARSER:Lss0;

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    new-instance p0, Lga0;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object p0, Lld1;->PARSER:Lss0;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit p1

    .line 36
    return-object p0

    .line 37
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0

    .line 39
    :cond_1
    return-object p0

    .line 40
    :pswitch_1
    sget-object p0, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_2
    new-instance p0, Lid1;

    .line 44
    .line 45
    sget-object p1, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_3
    new-instance p0, Lld1;

    .line 52
    .line 53
    invoke-direct {p0}, Lld1;-><init>()V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string v0, "bitField0_"

    .line 58
    .line 59
    const-string v1, "name_"

    .line 60
    .line 61
    const-string v2, "isAuto_"

    .line 62
    .line 63
    const-string v3, "clientStartTimeUs_"

    .line 64
    .line 65
    const-string v4, "durationUs_"

    .line 66
    .line 67
    const-string v5, "counters_"

    .line 68
    .line 69
    sget-object v6, Ljd1;->a:Lkl0;

    .line 70
    .line 71
    const-string v7, "subtraces_"

    .line 72
    .line 73
    const-class v8, Lld1;

    .line 74
    .line 75
    const-string v9, "customAttributes_"

    .line 76
    .line 77
    sget-object v10, Lkd1;->a:Lkl0;

    .line 78
    .line 79
    const-string v11, "perfSessions_"

    .line 80
    .line 81
    const-class v12, Lbt0;

    .line 82
    .line 83
    filled-new-array/range {v0 .. v12}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "\u0001\u0008\u0000\u0001\u0001\t\u0008\u0002\u0002\u0000\u0001\u1008\u0000\u0002\u1007\u0001\u0004\u1002\u0002\u0005\u1002\u0003\u00062\u0007\u001b\u00082\t\u001b"

    .line 88
    .line 89
    sget-object v0, Lld1;->DEFAULT_INSTANCE:Lld1;

    .line 90
    .line 91
    new-instance v1, Lox0;

    .line 92
    .line 93
    invoke-direct {v1, v0, p1, p0}, Lox0;-><init>(Lh0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-object v1

    .line 97
    :pswitch_5
    return-object p1

    .line 98
    :pswitch_6
    const/4 p0, 0x1

    .line 99
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    nop

    .line 105
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final r(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lld1;->perfSessions_:Lif0;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lk0;

    .line 5
    .line 6
    iget-boolean v1, v1, Lk0;->j:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lld1;->perfSessions_:Lif0;

    .line 15
    .line 16
    :cond_0
    invoke-static {p1, v0}, Lea0;->g(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final s(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lld1;->subtraces_:Lif0;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lk0;

    .line 5
    .line 6
    iget-boolean v1, v1, Lk0;->j:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lld1;->subtraces_:Lif0;

    .line 15
    .line 16
    :cond_0
    invoke-static {p1, v0}, Lea0;->g(Ljava/lang/Iterable;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final t(Lbt0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lld1;->perfSessions_:Lif0;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lk0;

    .line 5
    .line 6
    iget-boolean v1, v1, Lk0;->j:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lld1;->perfSessions_:Lif0;

    .line 15
    .line 16
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final u(Lld1;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lld1;->subtraces_:Lif0;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Lk0;

    .line 8
    .line 9
    iget-boolean v1, v1, Lk0;->j:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lld1;->subtraces_:Lif0;

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final v()Z
    .locals 1

    .line 1
    const-string v0, "Hosting_activity"

    .line 2
    .line 3
    iget-object p0, p0, Lld1;->customAttributes_:Lml0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final w()I
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->counters_:Lml0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final x()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->counters_:Lml0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final y()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lld1;->customAttributes_:Lml0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
