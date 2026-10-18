.class public Lhh;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lmj;


# static fields
.field public static final synthetic k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic n:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic p:J

.field public static final synthetic q:J

.field public static final synthetic r:J

.field public static final synthetic s:J

.field public static final synthetic t:J

.field public static final synthetic u:J

.field public static final synthetic v:J

.field public static final synthetic w:J

.field public static final synthetic x:J


# instance fields
.field private volatile synthetic _closeCause$volatile:Ljava/lang/Object;

.field private volatile synthetic bufferEnd$volatile:J

.field private volatile synthetic bufferEndSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic closeHandler$volatile:Ljava/lang/Object;

.field private volatile synthetic completedExpandBuffersAndPauseFlag$volatile:J

.field public final j:I

.field private volatile synthetic receiveSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic receivers$volatile:J

.field private volatile synthetic sendSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic sendersAndCloseStatus$volatile:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-class v0, Lhh;

    .line 2
    .line 3
    const-string v1, "sendersAndCloseStatus$volatile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sput-object v2, Lhh;->k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    sget-object v2, Lja;->a:Lsun/misc/Unsafe;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    sput-wide v3, Lhh;->x:J

    .line 22
    .line 23
    const-string v1, "receivers$volatile"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sput-object v3, Lhh;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    sput-wide v3, Lhh;->v:J

    .line 40
    .line 41
    const-string v1, "bufferEnd$volatile"

    .line 42
    .line 43
    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    sput-object v3, Lhh;->m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    sput-wide v3, Lhh;->q:J

    .line 58
    .line 59
    const-string v1, "completedExpandBuffersAndPauseFlag$volatile"

    .line 60
    .line 61
    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sput-object v3, Lhh;->n:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 72
    .line 73
    .line 74
    move-result-wide v3

    .line 75
    sput-wide v3, Lhh;->t:J

    .line 76
    .line 77
    const-string v1, "sendSegment$volatile"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    sput-wide v3, Lhh;->w:J

    .line 88
    .line 89
    const-class v1, Ljava/lang/Object;

    .line 90
    .line 91
    const-string v3, "receiveSegment$volatile"

    .line 92
    .line 93
    invoke-static {v0, v1, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sput-object v1, Lhh;->o:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    sput-wide v3, Lhh;->u:J

    .line 108
    .line 109
    const-string v1, "bufferEndSegment$volatile"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v3

    .line 119
    sput-wide v3, Lhh;->r:J

    .line 120
    .line 121
    const-string v1, "_closeCause$volatile"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v2, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 128
    .line 129
    .line 130
    move-result-wide v3

    .line 131
    sput-wide v3, Lhh;->p:J

    .line 132
    .line 133
    const-string v1, "closeHandler$volatile"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v2, v0}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 140
    .line 141
    .line 142
    move-result-wide v0

    .line 143
    sput-wide v0, Lhh;->s:J

    .line 144
    .line 145
    return-void
.end method

.method public constructor <init>(I)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lhh;->j:I

    .line 5
    .line 6
    if-ltz p1, :cond_3

    .line 7
    .line 8
    sget-object v0, Ljh;->a:Ltj;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const v0, 0x7fffffff

    .line 13
    .line 14
    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    int-to-long v0, p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const-wide/16 v0, 0x0

    .line 26
    .line 27
    :goto_0
    iput-wide v0, p0, Lhh;->bufferEnd$volatile:J

    .line 28
    .line 29
    invoke-virtual {p0}, Lhh;->k()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, Lhh;->completedExpandBuffersAndPauseFlag$volatile:J

    .line 34
    .line 35
    new-instance v2, Ltj;

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const/4 v7, 0x3

    .line 39
    const-wide/16 v3, 0x0

    .line 40
    .line 41
    move-object v6, p0

    .line 42
    invoke-direct/range {v2 .. v7}, Ltj;-><init>(JLtj;Lhh;I)V

    .line 43
    .line 44
    .line 45
    iput-object v2, v6, Lhh;->sendSegment$volatile:Ljava/lang/Object;

    .line 46
    .line 47
    iput-object v2, v6, Lhh;->receiveSegment$volatile:Ljava/lang/Object;

    .line 48
    .line 49
    invoke-virtual {v6}, Lhh;->w()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    sget-object v2, Ljh;->a:Ltj;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    :cond_2
    iput-object v2, v6, Lhh;->bufferEndSegment$volatile:Ljava/lang/Object;

    .line 61
    .line 62
    sget-object p0, Ljh;->s:Log0;

    .line 63
    .line 64
    iput-object p0, v6, Lhh;->_closeCause$volatile:Ljava/lang/Object;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    const-string p0, "Invalid channel capacity: "

    .line 68
    .line 69
    const-string v0, ", should be >=0"

    .line 70
    .line 71
    invoke-static {p0, v0, p1}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    throw p0
.end method

.method public static C(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p0, Lti;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    check-cast p0, Lti;

    .line 7
    .line 8
    sget-object v0, Ljh;->a:Ltj;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sget-object v2, Lwe1;->a:Lwe1;

    .line 12
    .line 13
    invoke-interface {p0, v2, v0}, Lti;->i(Ljava/lang/Object;Lg90;)Log0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0, v0}, Lti;->k(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    return v1

    .line 25
    :cond_1
    const-string v0, "Unexpected waiter: "

    .line 26
    .line 27
    invoke-static {p0, v0}, Lo40;->q(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return v1
.end method

.method public static synthetic r(Lhh;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lhh;->q(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final A(Lui1;Z)V
    .locals 1

    .line 1
    instance-of v0, p1, Lti;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Liq;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lhh;->m()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lhh;->o()Ljava/lang/Throwable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    new-instance p2, Lj11;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1, p2}, Liq;->d(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    instance-of p0, p1, Lgh;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    check-cast p1, Lgh;

    .line 32
    .line 33
    iget-object p0, p1, Lgh;->k:Lvi;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    const/4 p2, 0x0

    .line 39
    iput-object p2, p1, Lgh;->k:Lvi;

    .line 40
    .line 41
    sget-object p2, Ljh;->l:Log0;

    .line 42
    .line 43
    iput-object p2, p1, Lgh;->j:Ljava/lang/Object;

    .line 44
    .line 45
    iget-object p1, p1, Lgh;->l:Lhh;

    .line 46
    .line 47
    invoke-virtual {p1}, Lhh;->l()Ljava/lang/Throwable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    new-instance p2, Lj11;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Lvi;->d(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    const-string p0, "Unexpected waiter: "

    .line 69
    .line 70
    invoke-static {p1, p0}, Lo40;->q(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final B(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of p0, p1, Lgh;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    check-cast p1, Lgh;

    .line 9
    .line 10
    iget-object p0, p1, Lgh;->k:Lvi;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iput-object v2, p1, Lgh;->k:Lvi;

    .line 16
    .line 17
    iput-object p2, p1, Lgh;->j:Ljava/lang/Object;

    .line 18
    .line 19
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    sget-object p2, Ljh;->a:Ltj;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v2}, Lvi;->i(Ljava/lang/Object;Lg90;)Log0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lvi;->k(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return v1

    .line 33
    :cond_0
    return v0

    .line 34
    :cond_1
    instance-of p0, p1, Lti;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lti;

    .line 39
    .line 40
    sget-object p0, Ljh;->a:Ltj;

    .line 41
    .line 42
    invoke-interface {p1, p2, v2}, Lti;->i(Ljava/lang/Object;Lg90;)Log0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-interface {p1, p0}, Lti;->k(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    return v0

    .line 53
    :cond_3
    const-string p0, "Unexpected receiver type: "

    .line 54
    .line 55
    invoke-static {p1, p0}, Lo40;->q(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return v0
.end method

.method public final D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p1, Ltj;->h:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ltj;->k(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const-wide v3, 0xfffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    sget-wide v5, Lhh;->x:J

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    sget-object v7, Lja;->a:Lsun/misc/Unsafe;

    .line 18
    .line 19
    invoke-virtual {v7, p0, v5, v6}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v7

    .line 23
    and-long/2addr v7, v3

    .line 24
    cmp-long v7, p3, v7

    .line 25
    .line 26
    if-ltz v7, :cond_2

    .line 27
    .line 28
    if-nez p5, :cond_0

    .line 29
    .line 30
    sget-object p0, Ljh;->n:Log0;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-virtual {p1, v1, p2, p5}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lhh;->h()V

    .line 40
    .line 41
    .line 42
    sget-object p0, Ljh;->m:Log0;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    sget-object v7, Ljh;->d:Log0;

    .line 46
    .line 47
    if-ne v1, v7, :cond_2

    .line 48
    .line 49
    sget-object v7, Ljh;->i:Log0;

    .line 50
    .line 51
    invoke-virtual {p1, v1, p2, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Lhh;->h()V

    .line 58
    .line 59
    .line 60
    mul-int/lit8 p0, p2, 0x2

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p2, v2}, Ltj;->m(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_2
    invoke-virtual {p1, p2}, Ltj;->k(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-eqz v1, :cond_b

    .line 75
    .line 76
    sget-object v7, Ljh;->e:Log0;

    .line 77
    .line 78
    if-ne v1, v7, :cond_3

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    sget-object v7, Ljh;->d:Log0;

    .line 82
    .line 83
    if-ne v1, v7, :cond_4

    .line 84
    .line 85
    sget-object v7, Ljh;->i:Log0;

    .line 86
    .line 87
    invoke-virtual {p1, v1, p2, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    invoke-virtual {p0}, Lhh;->h()V

    .line 94
    .line 95
    .line 96
    mul-int/lit8 p0, p2, 0x2

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, p2, v2}, Ltj;->m(ILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_4
    sget-object v7, Ljh;->j:Log0;

    .line 107
    .line 108
    if-ne v1, v7, :cond_5

    .line 109
    .line 110
    sget-object p0, Ljh;->o:Log0;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_5
    sget-object v8, Ljh;->h:Log0;

    .line 114
    .line 115
    if-ne v1, v8, :cond_6

    .line 116
    .line 117
    sget-object p0, Ljh;->o:Log0;

    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_6
    sget-object v8, Ljh;->l:Log0;

    .line 121
    .line 122
    if-ne v1, v8, :cond_7

    .line 123
    .line 124
    invoke-virtual {p0}, Lhh;->h()V

    .line 125
    .line 126
    .line 127
    sget-object p0, Ljh;->o:Log0;

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_7
    sget-object v8, Ljh;->g:Log0;

    .line 131
    .line 132
    if-eq v1, v8, :cond_2

    .line 133
    .line 134
    sget-object v8, Ljh;->f:Log0;

    .line 135
    .line 136
    invoke-virtual {p1, v1, p2, v8}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    if-eqz v8, :cond_2

    .line 141
    .line 142
    instance-of p3, v1, Lvi1;

    .line 143
    .line 144
    if-eqz p3, :cond_8

    .line 145
    .line 146
    check-cast v1, Lvi1;

    .line 147
    .line 148
    iget-object v1, v1, Lvi1;->a:Lui1;

    .line 149
    .line 150
    :cond_8
    invoke-static {v1}, Lhh;->C(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    if-eqz p4, :cond_9

    .line 155
    .line 156
    sget-object p3, Ljh;->i:Log0;

    .line 157
    .line 158
    invoke-virtual {p1, p2, p3}, Ltj;->n(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Lhh;->h()V

    .line 162
    .line 163
    .line 164
    mul-int/lit8 p0, p2, 0x2

    .line 165
    .line 166
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1, p2, v2}, Ltj;->m(ILjava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    return-object p0

    .line 174
    :cond_9
    invoke-virtual {p1, p2, v7}, Ltj;->n(ILjava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1}, Lq31;->h()V

    .line 178
    .line 179
    .line 180
    if-eqz p3, :cond_a

    .line 181
    .line 182
    invoke-virtual {p0}, Lhh;->h()V

    .line 183
    .line 184
    .line 185
    :cond_a
    sget-object p0, Ljh;->o:Log0;

    .line 186
    .line 187
    return-object p0

    .line 188
    :cond_b
    :goto_0
    sget-object v7, Lja;->a:Lsun/misc/Unsafe;

    .line 189
    .line 190
    invoke-virtual {v7, p0, v5, v6}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 191
    .line 192
    .line 193
    move-result-wide v7

    .line 194
    and-long/2addr v7, v3

    .line 195
    cmp-long v7, p3, v7

    .line 196
    .line 197
    if-gez v7, :cond_c

    .line 198
    .line 199
    sget-object v7, Ljh;->h:Log0;

    .line 200
    .line 201
    invoke-virtual {p1, v1, p2, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_2

    .line 206
    .line 207
    invoke-virtual {p0}, Lhh;->h()V

    .line 208
    .line 209
    .line 210
    sget-object p0, Ljh;->o:Log0;

    .line 211
    .line 212
    return-object p0

    .line 213
    :cond_c
    if-nez p5, :cond_d

    .line 214
    .line 215
    sget-object p0, Ljh;->n:Log0;

    .line 216
    .line 217
    return-object p0

    .line 218
    :cond_d
    invoke-virtual {p1, v1, p2, p5}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_2

    .line 223
    .line 224
    invoke-virtual {p0}, Lhh;->h()V

    .line 225
    .line 226
    .line 227
    sget-object p0, Ljh;->m:Log0;

    .line 228
    .line 229
    return-object p0
.end method

.method public final E(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 4

    .line 1
    invoke-virtual {p1, p2, p3}, Ltj;->m(ILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    if-eqz p7, :cond_0

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p7}, Lhh;->F(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p1, p2}, Ltj;->k(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0, p4, p5}, Lhh;->a(J)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Ljh;->d:Log0;

    .line 26
    .line 27
    invoke-virtual {p1, v2, p2, v0}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_6

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    if-nez p6, :cond_2

    .line 35
    .line 36
    const/4 p0, 0x3

    .line 37
    return p0

    .line 38
    :cond_2
    invoke-virtual {p1, v2, p2, p6}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_6

    .line 43
    .line 44
    const/4 p0, 0x2

    .line 45
    return p0

    .line 46
    :cond_3
    instance-of v3, v0, Lui1;

    .line 47
    .line 48
    if-eqz v3, :cond_6

    .line 49
    .line 50
    invoke-virtual {p1, p2, v2}, Ltj;->m(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0, p3}, Lhh;->B(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_4

    .line 58
    .line 59
    sget-object p0, Ljh;->i:Log0;

    .line 60
    .line 61
    invoke-virtual {p1, p2, p0}, Ltj;->n(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return p0

    .line 66
    :cond_4
    sget-object p0, Ljh;->k:Log0;

    .line 67
    .line 68
    iget-object p3, p1, Ltj;->h:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 69
    .line 70
    mul-int/lit8 p4, p2, 0x2

    .line 71
    .line 72
    add-int/2addr p4, v1

    .line 73
    invoke-virtual {p3, p4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    if-eq p3, p0, :cond_5

    .line 78
    .line 79
    invoke-virtual {p1, p2, v1}, Ltj;->l(IZ)V

    .line 80
    .line 81
    .line 82
    :cond_5
    const/4 p0, 0x5

    .line 83
    return p0

    .line 84
    :cond_6
    invoke-virtual/range {p0 .. p7}, Lhh;->F(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0
.end method

.method public final F(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 5

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, Ltj;->k(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x4

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0, p4, p5}, Lhh;->a(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    if-nez p7, :cond_1

    .line 17
    .line 18
    sget-object v0, Ljh;->d:Log0;

    .line 19
    .line 20
    invoke-virtual {p1, v3, p2, v0}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    if-eqz p7, :cond_2

    .line 28
    .line 29
    sget-object v0, Ljh;->j:Log0;

    .line 30
    .line 31
    invoke-virtual {p1, v3, p2, v0}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, Lq31;->h()V

    .line 38
    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    if-nez p6, :cond_3

    .line 42
    .line 43
    const/4 p0, 0x3

    .line 44
    return p0

    .line 45
    :cond_3
    invoke-virtual {p1, v3, p2, p6}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    return p0

    .line 53
    :cond_4
    sget-object v4, Ljh;->e:Log0;

    .line 54
    .line 55
    if-ne v0, v4, :cond_5

    .line 56
    .line 57
    sget-object v1, Ljh;->d:Log0;

    .line 58
    .line 59
    invoke-virtual {p1, v0, p2, v1}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    :goto_0
    return v2

    .line 66
    :cond_5
    sget-object p4, Ljh;->k:Log0;

    .line 67
    .line 68
    const/4 p5, 0x5

    .line 69
    if-ne v0, p4, :cond_6

    .line 70
    .line 71
    invoke-virtual {p1, p2, v3}, Ltj;->m(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return p5

    .line 75
    :cond_6
    sget-object p6, Ljh;->h:Log0;

    .line 76
    .line 77
    if-ne v0, p6, :cond_7

    .line 78
    .line 79
    invoke-virtual {p1, p2, v3}, Ltj;->m(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return p5

    .line 83
    :cond_7
    sget-object p6, Ljh;->l:Log0;

    .line 84
    .line 85
    if-ne v0, p6, :cond_8

    .line 86
    .line 87
    invoke-virtual {p1, p2, v3}, Ltj;->m(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lhh;->u()V

    .line 91
    .line 92
    .line 93
    return v1

    .line 94
    :cond_8
    invoke-virtual {p1, p2, v3}, Ltj;->m(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    instance-of p6, v0, Lvi1;

    .line 98
    .line 99
    if-eqz p6, :cond_9

    .line 100
    .line 101
    check-cast v0, Lvi1;

    .line 102
    .line 103
    iget-object v0, v0, Lvi1;->a:Lui1;

    .line 104
    .line 105
    :cond_9
    invoke-virtual {p0, v0, p3}, Lhh;->B(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_a

    .line 110
    .line 111
    sget-object p0, Ljh;->i:Log0;

    .line 112
    .line 113
    invoke-virtual {p1, p2, p0}, Ltj;->n(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x0

    .line 117
    return p0

    .line 118
    :cond_a
    iget-object p0, p1, Ltj;->h:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 119
    .line 120
    mul-int/lit8 p3, p2, 0x2

    .line 121
    .line 122
    add-int/2addr p3, v2

    .line 123
    invoke-virtual {p0, p3, p4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    if-eq p0, p4, :cond_b

    .line 128
    .line 129
    invoke-virtual {p1, p2, v2}, Ltj;->l(IZ)V

    .line 130
    .line 131
    .line 132
    :cond_b
    return p5
.end method

.method public final G(J)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, Lhh;->w()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lhh;->k()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v2, p1

    .line 16
    .line 17
    if-lez v0, :cond_8

    .line 18
    .line 19
    sget v0, Ljh;->c:I

    .line 20
    .line 21
    const/4 v8, 0x0

    .line 22
    move v2, v8

    .line 23
    :goto_1
    const-wide v9, 0x3fffffffffffffffL    # 1.9999999999999998

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    sget-wide v11, Lhh;->t:J

    .line 29
    .line 30
    if-ge v2, v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v1}, Lhh;->k()J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    sget-object v5, Lja;->a:Lsun/misc/Unsafe;

    .line 37
    .line 38
    invoke-virtual {v5, v1, v11, v12}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    and-long/2addr v5, v9

    .line 43
    cmp-long v5, v3, v5

    .line 44
    .line 45
    if-nez v5, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1}, Lhh;->k()J

    .line 48
    .line 49
    .line 50
    move-result-wide v5

    .line 51
    cmp-long v3, v3, v5

    .line 52
    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    goto :goto_6

    .line 56
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    :goto_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 60
    .line 61
    invoke-virtual {v0, v1, v11, v12}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    and-long v2, v4, v9

    .line 66
    .line 67
    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    .line 68
    .line 69
    add-long v6, v13, v2

    .line 70
    .line 71
    sget-wide v2, Lhh;->t:J

    .line 72
    .line 73
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_7

    .line 78
    .line 79
    :goto_3
    invoke-virtual {v1}, Lhh;->k()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 84
    .line 85
    invoke-virtual {v0, v1, v11, v12}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 86
    .line 87
    .line 88
    move-result-wide v4

    .line 89
    and-long v6, v4, v9

    .line 90
    .line 91
    and-long v15, v4, v13

    .line 92
    .line 93
    const-wide/16 v17, 0x0

    .line 94
    .line 95
    cmp-long v15, v15, v17

    .line 96
    .line 97
    if-eqz v15, :cond_3

    .line 98
    .line 99
    const/4 v15, 0x1

    .line 100
    goto :goto_4

    .line 101
    :cond_3
    move v15, v8

    .line 102
    :goto_4
    cmp-long v16, v2, v6

    .line 103
    .line 104
    if-nez v16, :cond_5

    .line 105
    .line 106
    invoke-virtual {v1}, Lhh;->k()J

    .line 107
    .line 108
    .line 109
    move-result-wide v16

    .line 110
    cmp-long v2, v2, v16

    .line 111
    .line 112
    if-nez v2, :cond_5

    .line 113
    .line 114
    :goto_5
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 115
    .line 116
    invoke-virtual {v0, v1, v11, v12}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 117
    .line 118
    .line 119
    move-result-wide v4

    .line 120
    and-long v6, v4, v9

    .line 121
    .line 122
    sget-wide v2, Lhh;->t:J

    .line 123
    .line 124
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_4

    .line 129
    .line 130
    :goto_6
    return-void

    .line 131
    :cond_4
    move-object/from16 v1, p0

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_5
    if-nez v15, :cond_6

    .line 135
    .line 136
    add-long/2addr v6, v13

    .line 137
    sget-wide v2, Lhh;->t:J

    .line 138
    .line 139
    move-object/from16 v1, p0

    .line 140
    .line 141
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_6
    move-object/from16 v1, p0

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_7
    move-object/from16 v1, p0

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_8
    move-object/from16 v1, p0

    .line 152
    .line 153
    goto/16 :goto_0
.end method

.method public final a(J)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lhh;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v0, p1, v0

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lhh;->n()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget p0, p0, Lhh;->j:I

    .line 14
    .line 15
    int-to-long v2, p0

    .line 16
    add-long/2addr v0, v2

    .line 17
    cmp-long p0, p1, v0

    .line 18
    .line 19
    if-gez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public b(Liq;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 4
    .line 5
    sget-wide v8, Lhh;->w:J

    .line 6
    .line 7
    invoke-virtual {v1, v0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ltj;

    .line 12
    .line 13
    :cond_0
    :goto_0
    sget-object v10, Lhh;->k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v10, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    const-wide v11, 0xfffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    and-long v4, v2, v11

    .line 25
    .line 26
    const/4 v13, 0x0

    .line 27
    invoke-virtual {v0, v13, v2, v3}, Lhh;->s(ZJ)Z

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    sget v14, Ljh;->b:I

    .line 32
    .line 33
    int-to-long v2, v14

    .line 34
    move-wide v15, v11

    .line 35
    div-long v11, v4, v2

    .line 36
    .line 37
    rem-long v2, v4, v2

    .line 38
    .line 39
    long-to-int v2, v2

    .line 40
    move/from16 v18, v14

    .line 41
    .line 42
    iget-wide v13, v1, Lq31;->d:J

    .line 43
    .line 44
    cmp-long v3, v13, v11

    .line 45
    .line 46
    sget-object v13, Lar;->j:Lar;

    .line 47
    .line 48
    sget-object v14, Lwe1;->a:Lwe1;

    .line 49
    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0, v11, v12, v1}, Lhh;->j(JLtj;)Ltj;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    if-nez v3, :cond_1

    .line 57
    .line 58
    if-eqz v7, :cond_0

    .line 59
    .line 60
    invoke-virtual/range {p0 .. p2}, Lhh;->y(Liq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-ne v0, v13, :cond_19

    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_1
    move-object v1, v3

    .line 68
    :cond_2
    const/4 v6, 0x0

    .line 69
    move-object/from16 v3, p2

    .line 70
    .line 71
    invoke-virtual/range {v0 .. v7}, Lhh;->E(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-eqz v6, :cond_1a

    .line 76
    .line 77
    const/4 v11, 0x1

    .line 78
    if-eq v6, v11, :cond_19

    .line 79
    .line 80
    const/4 v12, 0x2

    .line 81
    if-eq v6, v12, :cond_18

    .line 82
    .line 83
    const/4 v0, 0x5

    .line 84
    const/4 v3, 0x4

    .line 85
    const/4 v7, 0x3

    .line 86
    if-eq v6, v7, :cond_6

    .line 87
    .line 88
    if-eq v6, v3, :cond_4

    .line 89
    .line 90
    if-eq v6, v0, :cond_3

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    invoke-virtual {v1}, Lsm;->a()V

    .line 94
    .line 95
    .line 96
    :goto_1
    move-object/from16 v0, p0

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lhh;->n()J

    .line 100
    .line 101
    .line 102
    move-result-wide v2

    .line 103
    cmp-long v0, v4, v2

    .line 104
    .line 105
    if-gez v0, :cond_5

    .line 106
    .line 107
    invoke-virtual {v1}, Lsm;->a()V

    .line 108
    .line 109
    .line 110
    :cond_5
    invoke-virtual/range {p0 .. p2}, Lhh;->y(Liq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-ne v0, v13, :cond_19

    .line 115
    .line 116
    return-object v0

    .line 117
    :cond_6
    invoke-static/range {p1 .. p1}, Lqe0;->i(Liq;)Liq;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-static {v6}, Las;->m(Liq;)Lvi;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    move/from16 v19, v7

    .line 126
    .line 127
    const/4 v7, 0x0

    .line 128
    move-object/from16 v0, p0

    .line 129
    .line 130
    move-wide/from16 v20, v15

    .line 131
    .line 132
    move v15, v3

    .line 133
    move-object/from16 v3, p2

    .line 134
    .line 135
    :try_start_0
    invoke-virtual/range {v0 .. v7}, Lhh;->E(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 136
    .line 137
    .line 138
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    if-eqz v7, :cond_16

    .line 140
    .line 141
    if-eq v7, v11, :cond_15

    .line 142
    .line 143
    if-eq v7, v12, :cond_14

    .line 144
    .line 145
    if-eq v7, v15, :cond_13

    .line 146
    .line 147
    const-string v2, "unexpected"

    .line 148
    .line 149
    const/4 v4, 0x5

    .line 150
    if-ne v7, v4, :cond_12

    .line 151
    .line 152
    :try_start_1
    invoke-virtual {v1}, Lsm;->a()V

    .line 153
    .line 154
    .line 155
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 156
    .line 157
    invoke-virtual {v1, v0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    check-cast v1, Ltj;

    .line 162
    .line 163
    :goto_2
    invoke-virtual {v10, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 164
    .line 165
    .line 166
    move-result-wide v4

    .line 167
    and-long v7, v4, v20

    .line 168
    .line 169
    const/4 v9, 0x0

    .line 170
    invoke-virtual {v0, v9, v4, v5}, Lhh;->s(ZJ)Z

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    sget v5, Ljh;->b:I

    .line 175
    .line 176
    move-object/from16 v17, v10

    .line 177
    .line 178
    int-to-long v9, v5

    .line 179
    move-object/from16 v19, v13

    .line 180
    .line 181
    div-long v12, v7, v9

    .line 182
    .line 183
    rem-long v9, v7, v9

    .line 184
    .line 185
    long-to-int v9, v9

    .line 186
    move-wide/from16 v22, v12

    .line 187
    .line 188
    iget-wide v11, v1, Lq31;->d:J

    .line 189
    .line 190
    cmp-long v11, v11, v22

    .line 191
    .line 192
    if-eqz v11, :cond_a

    .line 193
    .line 194
    move-wide/from16 v11, v22

    .line 195
    .line 196
    invoke-virtual {v0, v11, v12, v1}, Lhh;->j(JLtj;)Ltj;

    .line 197
    .line 198
    .line 199
    move-result-object v11

    .line 200
    if-nez v11, :cond_9

    .line 201
    .line 202
    if-eqz v4, :cond_8

    .line 203
    .line 204
    :cond_7
    :goto_3
    invoke-virtual {v0, v3, v6}, Lhh;->z(Ljava/lang/Object;Lvi;)V

    .line 205
    .line 206
    .line 207
    goto/16 :goto_8

    .line 208
    .line 209
    :catchall_0
    move-exception v0

    .line 210
    goto/16 :goto_a

    .line 211
    .line 212
    :cond_8
    move-object/from16 v10, v17

    .line 213
    .line 214
    move-object/from16 v13, v19

    .line 215
    .line 216
    const/4 v11, 0x1

    .line 217
    const/4 v12, 0x2

    .line 218
    goto :goto_2

    .line 219
    :cond_9
    move v1, v9

    .line 220
    move-object v9, v2

    .line 221
    move v2, v1

    .line 222
    move-object v1, v11

    .line 223
    :goto_4
    move-wide/from16 v24, v7

    .line 224
    .line 225
    move v7, v4

    .line 226
    move v8, v5

    .line 227
    move-wide/from16 v4, v24

    .line 228
    .line 229
    goto :goto_5

    .line 230
    :cond_a
    move/from16 v24, v9

    .line 231
    .line 232
    move-object v9, v2

    .line 233
    move/from16 v2, v24

    .line 234
    .line 235
    goto :goto_4

    .line 236
    :goto_5
    invoke-virtual/range {v0 .. v7}, Lhh;->E(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 237
    .line 238
    .line 239
    move-result v11

    .line 240
    if-eqz v11, :cond_11

    .line 241
    .line 242
    const/4 v10, 0x1

    .line 243
    if-eq v11, v10, :cond_10

    .line 244
    .line 245
    const/4 v12, 0x2

    .line 246
    if-eq v11, v12, :cond_e

    .line 247
    .line 248
    const/4 v13, 0x3

    .line 249
    if-eq v11, v13, :cond_d

    .line 250
    .line 251
    if-eq v11, v15, :cond_c

    .line 252
    .line 253
    const/4 v2, 0x5

    .line 254
    if-eq v11, v2, :cond_b

    .line 255
    .line 256
    goto :goto_6

    .line 257
    :cond_b
    invoke-virtual {v1}, Lsm;->a()V

    .line 258
    .line 259
    .line 260
    :goto_6
    move-object v2, v9

    .line 261
    move v11, v10

    .line 262
    move-object/from16 v10, v17

    .line 263
    .line 264
    move-object/from16 v13, v19

    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_c
    invoke-virtual {v0}, Lhh;->n()J

    .line 268
    .line 269
    .line 270
    move-result-wide v7

    .line 271
    cmp-long v2, v4, v7

    .line 272
    .line 273
    if-gez v2, :cond_7

    .line 274
    .line 275
    invoke-virtual {v1}, Lsm;->a()V

    .line 276
    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 280
    .line 281
    invoke-direct {v0, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    throw v0

    .line 285
    :cond_e
    if-eqz v7, :cond_f

    .line 286
    .line 287
    invoke-virtual {v1}, Lq31;->h()V

    .line 288
    .line 289
    .line 290
    goto :goto_3

    .line 291
    :cond_f
    add-int v9, v2, v8

    .line 292
    .line 293
    invoke-virtual {v6, v1, v9}, Lvi;->a(Lq31;I)V

    .line 294
    .line 295
    .line 296
    goto :goto_8

    .line 297
    :cond_10
    :goto_7
    invoke-virtual {v6, v14}, Lvi;->d(Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    goto :goto_8

    .line 301
    :cond_11
    invoke-virtual {v1}, Lsm;->a()V

    .line 302
    .line 303
    .line 304
    goto :goto_7

    .line 305
    :cond_12
    move-object v9, v2

    .line 306
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 307
    .line 308
    invoke-direct {v0, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    throw v0

    .line 312
    :cond_13
    move-object/from16 v19, v13

    .line 313
    .line 314
    invoke-virtual {v0}, Lhh;->n()J

    .line 315
    .line 316
    .line 317
    move-result-wide v7

    .line 318
    cmp-long v2, v4, v7

    .line 319
    .line 320
    if-gez v2, :cond_7

    .line 321
    .line 322
    invoke-virtual {v1}, Lsm;->a()V

    .line 323
    .line 324
    .line 325
    goto :goto_3

    .line 326
    :cond_14
    move-object/from16 v19, v13

    .line 327
    .line 328
    add-int v2, v2, v18

    .line 329
    .line 330
    invoke-virtual {v6, v1, v2}, Lvi;->a(Lq31;I)V

    .line 331
    .line 332
    .line 333
    goto :goto_8

    .line 334
    :cond_15
    move-object/from16 v19, v13

    .line 335
    .line 336
    invoke-virtual {v6, v14}, Lvi;->d(Ljava/lang/Object;)V

    .line 337
    .line 338
    .line 339
    goto :goto_8

    .line 340
    :cond_16
    move-object/from16 v19, v13

    .line 341
    .line 342
    invoke-virtual {v1}, Lsm;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 343
    .line 344
    .line 345
    goto :goto_7

    .line 346
    :goto_8
    invoke-virtual {v6}, Lvi;->s()Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    move-object/from16 v2, v19

    .line 351
    .line 352
    if-ne v0, v2, :cond_17

    .line 353
    .line 354
    goto :goto_9

    .line 355
    :cond_17
    move-object v0, v14

    .line 356
    :goto_9
    if-ne v0, v2, :cond_19

    .line 357
    .line 358
    return-object v0

    .line 359
    :goto_a
    invoke-virtual {v6}, Lvi;->z()V

    .line 360
    .line 361
    .line 362
    throw v0

    .line 363
    :cond_18
    move-object/from16 v0, p0

    .line 364
    .line 365
    move-object/from16 v3, p2

    .line 366
    .line 367
    move-object v2, v13

    .line 368
    if-eqz v7, :cond_19

    .line 369
    .line 370
    invoke-virtual {v1}, Lq31;->h()V

    .line 371
    .line 372
    .line 373
    invoke-virtual/range {p0 .. p2}, Lhh;->y(Liq;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    if-ne v0, v2, :cond_19

    .line 378
    .line 379
    return-object v0

    .line 380
    :cond_19
    return-object v14

    .line 381
    :cond_1a
    invoke-virtual {v1}, Lsm;->a()V

    .line 382
    .line 383
    .line 384
    return-object v14
.end method

.method public final c(Ljava/lang/Throwable;Z)Z
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/16 v8, 0x3c

    .line 4
    .line 5
    const-wide v9, 0xfffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    :goto_0
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 13
    .line 14
    sget-wide v2, Lhh;->x:J

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    shr-long v6, v4, v8

    .line 21
    .line 22
    long-to-int v6, v6

    .line 23
    if-nez v6, :cond_1

    .line 24
    .line 25
    and-long v6, v4, v9

    .line 26
    .line 27
    sget-object v11, Ljh;->a:Ltj;

    .line 28
    .line 29
    const-wide/high16 v11, 0x1000000000000000L

    .line 30
    .line 31
    add-long/2addr v6, v11

    .line 32
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    move-object/from16 v1, p0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    sget-object v4, Ljh;->s:Log0;

    .line 43
    .line 44
    :cond_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 45
    .line 46
    sget-wide v2, Lhh;->p:J

    .line 47
    .line 48
    move-object/from16 v1, p0

    .line 49
    .line 50
    move-object/from16 v5, p1

    .line 51
    .line 52
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    const/4 v11, 0x1

    .line 57
    if-eqz v6, :cond_3

    .line 58
    .line 59
    move v12, v11

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-eq v0, v4, :cond_2

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    move v12, v0

    .line 69
    :goto_2
    const-wide/high16 v13, 0x3000000000000000L    # 1.727233711018889E-77

    .line 70
    .line 71
    if-eqz p2, :cond_5

    .line 72
    .line 73
    :cond_4
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 74
    .line 75
    sget-wide v2, Lhh;->x:J

    .line 76
    .line 77
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 78
    .line 79
    .line 80
    move-result-wide v4

    .line 81
    and-long v6, v4, v9

    .line 82
    .line 83
    add-long/2addr v6, v13

    .line 84
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_5
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 92
    .line 93
    sget-wide v2, Lhh;->x:J

    .line 94
    .line 95
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide v4

    .line 99
    shr-long v6, v4, v8

    .line 100
    .line 101
    long-to-int v6, v6

    .line 102
    if-eqz v6, :cond_7

    .line 103
    .line 104
    if-eq v6, v11, :cond_6

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_6
    and-long v6, v4, v9

    .line 108
    .line 109
    add-long/2addr v6, v13

    .line 110
    goto :goto_3

    .line 111
    :cond_7
    and-long v6, v4, v9

    .line 112
    .line 113
    const-wide/high16 v15, 0x2000000000000000L

    .line 114
    .line 115
    add-long/2addr v6, v15

    .line 116
    :goto_3
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    :goto_4
    invoke-virtual {v1}, Lhh;->u()V

    .line 123
    .line 124
    .line 125
    if-eqz v12, :cond_c

    .line 126
    .line 127
    :goto_5
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 128
    .line 129
    sget-wide v6, Lhh;->s:J

    .line 130
    .line 131
    invoke-virtual {v0, v1, v6, v7}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    if-nez v4, :cond_8

    .line 136
    .line 137
    sget-object v0, Ljh;->q:Log0;

    .line 138
    .line 139
    :goto_6
    move-object v5, v0

    .line 140
    goto :goto_7

    .line 141
    :cond_8
    sget-object v0, Ljh;->r:Log0;

    .line 142
    .line 143
    goto :goto_6

    .line 144
    :cond_9
    :goto_7
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 145
    .line 146
    sget-wide v2, Lhh;->s:J

    .line 147
    .line 148
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_b

    .line 153
    .line 154
    if-nez v4, :cond_a

    .line 155
    .line 156
    goto :goto_8

    .line 157
    :cond_a
    invoke-static {v11, v4}, Lfe1;->e(ILjava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    check-cast v4, Lr80;

    .line 161
    .line 162
    invoke-virtual {v1}, Lhh;->l()Ljava/lang/Throwable;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-interface {v4, v0}, Lr80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    return v12

    .line 170
    :cond_b
    invoke-virtual {v0, v1, v6, v7}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    if-eq v0, v4, :cond_9

    .line 175
    .line 176
    goto :goto_5

    .line 177
    :cond_c
    :goto_8
    return v12
.end method

.method public final d(J)Ltj;
    .locals 11

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->r:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-wide v2, Lhh;->w:J

    .line 10
    .line 11
    invoke-virtual {v0, p0, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ltj;

    .line 16
    .line 17
    iget-wide v3, v2, Lq31;->d:J

    .line 18
    .line 19
    move-object v5, v1

    .line 20
    check-cast v5, Ltj;

    .line 21
    .line 22
    iget-wide v5, v5, Lq31;->d:J

    .line 23
    .line 24
    cmp-long v3, v3, v5

    .line 25
    .line 26
    if-lez v3, :cond_0

    .line 27
    .line 28
    move-object v1, v2

    .line 29
    :cond_0
    sget-wide v2, Lhh;->u:J

    .line 30
    .line 31
    invoke-virtual {v0, p0, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ltj;

    .line 36
    .line 37
    iget-wide v2, v0, Lq31;->d:J

    .line 38
    .line 39
    move-object v4, v1

    .line 40
    check-cast v4, Ltj;

    .line 41
    .line 42
    iget-wide v4, v4, Lq31;->d:J

    .line 43
    .line 44
    cmp-long v2, v2, v4

    .line 45
    .line 46
    if-lez v2, :cond_1

    .line 47
    .line 48
    move-object v1, v0

    .line 49
    :cond_1
    check-cast v1, Lsm;

    .line 50
    .line 51
    :cond_2
    move-object v3, v1

    .line 52
    :goto_0
    sget v0, Lsm;->c:I

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 58
    .line 59
    sget-wide v1, Lsm;->a:J

    .line 60
    .line 61
    invoke-virtual {v0, v3, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v7, Lqe0;->c:Log0;

    .line 66
    .line 67
    if-ne v0, v7, :cond_3

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    move-object v1, v0

    .line 71
    check-cast v1, Lsm;

    .line 72
    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    :cond_4
    sget-object v2, Lja;->a:Lsun/misc/Unsafe;

    .line 76
    .line 77
    sget-wide v4, Lsm;->a:J

    .line 78
    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-virtual/range {v2 .. v7}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_15

    .line 85
    .line 86
    :goto_1
    check-cast v3, Ltj;

    .line 87
    .line 88
    invoke-virtual {p0}, Lhh;->v()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const/4 v1, 0x1

    .line 93
    const/4 v2, -0x1

    .line 94
    if-eqz v0, :cond_b

    .line 95
    .line 96
    move-object v0, v3

    .line 97
    :cond_5
    sget v4, Ljh;->b:I

    .line 98
    .line 99
    sub-int/2addr v4, v1

    .line 100
    :goto_2
    const-wide/16 v5, -0x1

    .line 101
    .line 102
    if-ge v2, v4, :cond_a

    .line 103
    .line 104
    iget-wide v7, v0, Lq31;->d:J

    .line 105
    .line 106
    sget v9, Ljh;->b:I

    .line 107
    .line 108
    int-to-long v9, v9

    .line 109
    mul-long/2addr v7, v9

    .line 110
    int-to-long v9, v4

    .line 111
    add-long/2addr v7, v9

    .line 112
    invoke-virtual {p0}, Lhh;->n()J

    .line 113
    .line 114
    .line 115
    move-result-wide v9

    .line 116
    cmp-long v9, v7, v9

    .line 117
    .line 118
    if-gez v9, :cond_6

    .line 119
    .line 120
    :goto_3
    move-wide v7, v5

    .line 121
    goto :goto_5

    .line 122
    :cond_6
    invoke-virtual {v0, v4}, Ltj;->k(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    if-eqz v9, :cond_8

    .line 127
    .line 128
    sget-object v10, Ljh;->e:Log0;

    .line 129
    .line 130
    if-ne v9, v10, :cond_7

    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_7
    sget-object v10, Ljh;->d:Log0;

    .line 134
    .line 135
    if-ne v9, v10, :cond_9

    .line 136
    .line 137
    goto :goto_5

    .line 138
    :cond_8
    :goto_4
    sget-object v10, Ljh;->l:Log0;

    .line 139
    .line 140
    invoke-virtual {v0, v9, v4, v10}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    if-eqz v9, :cond_6

    .line 145
    .line 146
    invoke-virtual {v0}, Lq31;->h()V

    .line 147
    .line 148
    .line 149
    :cond_9
    add-int/lit8 v4, v4, -0x1

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_a
    sget-object v4, Lja;->a:Lsun/misc/Unsafe;

    .line 153
    .line 154
    sget-wide v7, Lsm;->b:J

    .line 155
    .line 156
    invoke-virtual {v4, v0, v7, v8}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lsm;

    .line 161
    .line 162
    check-cast v0, Ltj;

    .line 163
    .line 164
    if-nez v0, :cond_5

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :goto_5
    cmp-long v0, v7, v5

    .line 168
    .line 169
    if-eqz v0, :cond_b

    .line 170
    .line 171
    invoke-virtual {p0, v7, v8}, Lhh;->g(J)V

    .line 172
    .line 173
    .line 174
    :cond_b
    const/4 v0, 0x0

    .line 175
    move-object v4, v3

    .line 176
    :goto_6
    if-eqz v4, :cond_12

    .line 177
    .line 178
    sget v5, Ljh;->b:I

    .line 179
    .line 180
    sub-int/2addr v5, v1

    .line 181
    :goto_7
    if-ge v2, v5, :cond_11

    .line 182
    .line 183
    iget-wide v6, v4, Lq31;->d:J

    .line 184
    .line 185
    sget v8, Ljh;->b:I

    .line 186
    .line 187
    int-to-long v8, v8

    .line 188
    mul-long/2addr v6, v8

    .line 189
    int-to-long v8, v5

    .line 190
    add-long/2addr v6, v8

    .line 191
    cmp-long v6, v6, p1

    .line 192
    .line 193
    if-ltz v6, :cond_12

    .line 194
    .line 195
    :cond_c
    invoke-virtual {v4, v5}, Ltj;->k(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    if-eqz v6, :cond_f

    .line 200
    .line 201
    sget-object v7, Ljh;->e:Log0;

    .line 202
    .line 203
    if-ne v6, v7, :cond_d

    .line 204
    .line 205
    goto :goto_8

    .line 206
    :cond_d
    instance-of v7, v6, Lvi1;

    .line 207
    .line 208
    if-eqz v7, :cond_e

    .line 209
    .line 210
    sget-object v7, Ljh;->l:Log0;

    .line 211
    .line 212
    invoke-virtual {v4, v6, v5, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    if-eqz v7, :cond_c

    .line 217
    .line 218
    check-cast v6, Lvi1;

    .line 219
    .line 220
    iget-object v6, v6, Lvi1;->a:Lui1;

    .line 221
    .line 222
    invoke-static {v0, v6}, Lst;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v4, v5, v1}, Ltj;->l(IZ)V

    .line 227
    .line 228
    .line 229
    goto :goto_9

    .line 230
    :cond_e
    instance-of v7, v6, Lui1;

    .line 231
    .line 232
    if-eqz v7, :cond_10

    .line 233
    .line 234
    sget-object v7, Ljh;->l:Log0;

    .line 235
    .line 236
    invoke-virtual {v4, v6, v5, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    if-eqz v7, :cond_c

    .line 241
    .line 242
    invoke-static {v0, v6}, Lst;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v4, v5, v1}, Ltj;->l(IZ)V

    .line 247
    .line 248
    .line 249
    goto :goto_9

    .line 250
    :cond_f
    :goto_8
    sget-object v7, Ljh;->l:Log0;

    .line 251
    .line 252
    invoke-virtual {v4, v6, v5, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v6

    .line 256
    if-eqz v6, :cond_c

    .line 257
    .line 258
    invoke-virtual {v4}, Lq31;->h()V

    .line 259
    .line 260
    .line 261
    :cond_10
    :goto_9
    add-int/lit8 v5, v5, -0x1

    .line 262
    .line 263
    goto :goto_7

    .line 264
    :cond_11
    sget-object v5, Lja;->a:Lsun/misc/Unsafe;

    .line 265
    .line 266
    sget-wide v6, Lsm;->b:J

    .line 267
    .line 268
    invoke-virtual {v5, v4, v6, v7}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    check-cast v4, Lsm;

    .line 273
    .line 274
    check-cast v4, Ltj;

    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_12
    if-eqz v0, :cond_14

    .line 278
    .line 279
    instance-of p1, v0, Ljava/util/ArrayList;

    .line 280
    .line 281
    if-nez p1, :cond_13

    .line 282
    .line 283
    check-cast v0, Lui1;

    .line 284
    .line 285
    invoke-virtual {p0, v0, v1}, Lhh;->A(Lui1;Z)V

    .line 286
    .line 287
    .line 288
    return-object v3

    .line 289
    :cond_13
    check-cast v0, Ljava/util/ArrayList;

    .line 290
    .line 291
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    sub-int/2addr p1, v1

    .line 296
    :goto_a
    if-ge v2, p1, :cond_14

    .line 297
    .line 298
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object p2

    .line 302
    check-cast p2, Lui1;

    .line 303
    .line 304
    invoke-virtual {p0, p2, v1}, Lhh;->A(Lui1;Z)V

    .line 305
    .line 306
    .line 307
    add-int/lit8 p1, p1, -0x1

    .line 308
    .line 309
    goto :goto_a

    .line 310
    :cond_14
    return-object v3

    .line 311
    :cond_15
    invoke-virtual {v2, v3, v4, v5}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    if-eqz v0, :cond_4

    .line 316
    .line 317
    goto/16 :goto_0
.end method

.method public e(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 4
    .line 5
    sget-wide v2, Lhh;->x:J

    .line 6
    .line 7
    invoke-virtual {v1, v0, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const/4 v8, 0x0

    .line 12
    invoke-virtual {v0, v8, v2, v3}, Lhh;->s(ZJ)Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    const/4 v9, 0x1

    .line 17
    const-wide v10, 0xfffffffffffffffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    move v2, v8

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    and-long/2addr v2, v10

    .line 27
    invoke-virtual {v0, v2, v3}, Lhh;->a(J)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    xor-int/2addr v2, v9

    .line 32
    :goto_0
    sget-object v12, Lsj;->b:Lrj;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    return-object v12

    .line 37
    :cond_1
    sget-object v6, Ljh;->j:Log0;

    .line 38
    .line 39
    sget-wide v2, Lhh;->w:J

    .line 40
    .line 41
    invoke-virtual {v1, v0, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ltj;

    .line 46
    .line 47
    :goto_1
    sget-object v2, Lhh;->k:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    and-long v4, v2, v10

    .line 54
    .line 55
    invoke-virtual {v0, v8, v2, v3}, Lhh;->s(ZJ)Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    sget v13, Ljh;->b:I

    .line 60
    .line 61
    int-to-long v2, v13

    .line 62
    div-long v14, v4, v2

    .line 63
    .line 64
    rem-long v2, v4, v2

    .line 65
    .line 66
    long-to-int v2, v2

    .line 67
    iget-wide v10, v1, Lq31;->d:J

    .line 68
    .line 69
    cmp-long v3, v10, v14

    .line 70
    .line 71
    if-eqz v3, :cond_4

    .line 72
    .line 73
    invoke-virtual {v0, v14, v15, v1}, Lhh;->j(JLtj;)Ltj;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    if-nez v3, :cond_3

    .line 78
    .line 79
    if-eqz v7, :cond_2

    .line 80
    .line 81
    invoke-virtual {v0}, Lhh;->o()Ljava/lang/Throwable;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Lqj;

    .line 86
    .line 87
    invoke-direct {v1, v0}, Lqj;-><init>(Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    return-object v1

    .line 91
    :cond_2
    const-wide v10, 0xfffffffffffffffL

    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    move-object v1, v3

    .line 98
    :cond_4
    move-object/from16 v3, p1

    .line 99
    .line 100
    invoke-virtual/range {v0 .. v7}, Lhh;->E(Ltj;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    sget-object v0, Lwe1;->a:Lwe1;

    .line 105
    .line 106
    if-eqz v10, :cond_e

    .line 107
    .line 108
    if-eq v10, v9, :cond_d

    .line 109
    .line 110
    const/4 v0, 0x2

    .line 111
    const/4 v3, 0x0

    .line 112
    if-eq v10, v0, :cond_9

    .line 113
    .line 114
    const/4 v0, 0x3

    .line 115
    if-eq v10, v0, :cond_8

    .line 116
    .line 117
    const/4 v0, 0x4

    .line 118
    if-eq v10, v0, :cond_6

    .line 119
    .line 120
    const/4 v0, 0x5

    .line 121
    if-eq v10, v0, :cond_5

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    invoke-virtual {v1}, Lsm;->a()V

    .line 125
    .line 126
    .line 127
    :goto_2
    const-wide v10, 0xfffffffffffffffL

    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    move-object/from16 v0, p0

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lhh;->n()J

    .line 136
    .line 137
    .line 138
    move-result-wide v2

    .line 139
    cmp-long v0, v4, v2

    .line 140
    .line 141
    if-gez v0, :cond_7

    .line 142
    .line 143
    invoke-virtual {v1}, Lsm;->a()V

    .line 144
    .line 145
    .line 146
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lhh;->o()Ljava/lang/Throwable;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Lqj;

    .line 151
    .line 152
    invoke-direct {v1, v0}, Lqj;-><init>(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    return-object v1

    .line 156
    :cond_8
    const-string v0, "unexpected"

    .line 157
    .line 158
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-object v3

    .line 162
    :cond_9
    if-eqz v7, :cond_a

    .line 163
    .line 164
    invoke-virtual {v1}, Lq31;->h()V

    .line 165
    .line 166
    .line 167
    invoke-virtual/range {p0 .. p0}, Lhh;->o()Ljava/lang/Throwable;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Lqj;

    .line 172
    .line 173
    invoke-direct {v1, v0}, Lqj;-><init>(Ljava/lang/Throwable;)V

    .line 174
    .line 175
    .line 176
    return-object v1

    .line 177
    :cond_a
    instance-of v0, v6, Lui1;

    .line 178
    .line 179
    if-eqz v0, :cond_b

    .line 180
    .line 181
    move-object v3, v6

    .line 182
    check-cast v3, Lui1;

    .line 183
    .line 184
    :cond_b
    if-eqz v3, :cond_c

    .line 185
    .line 186
    add-int/2addr v2, v13

    .line 187
    invoke-interface {v3, v1, v2}, Lui1;->a(Lq31;I)V

    .line 188
    .line 189
    .line 190
    :cond_c
    invoke-virtual {v1}, Lq31;->h()V

    .line 191
    .line 192
    .line 193
    return-object v12

    .line 194
    :cond_d
    return-object v0

    .line 195
    :cond_e
    invoke-virtual {v1}, Lsm;->a()V

    .line 196
    .line 197
    .line 198
    return-object v0
.end method

.method public final f(Ljava/util/concurrent/CancellationException;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/util/concurrent/CancellationException;

    .line 4
    .line 5
    const-string v0, "Channel was cancelled"

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, Lhh;->c(Ljava/lang/Throwable;Z)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final g(J)V
    .locals 11

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->u:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ltj;

    .line 10
    .line 11
    :goto_0
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 12
    .line 13
    sget-wide v3, Lhh;->v:J

    .line 14
    .line 15
    invoke-virtual {v1, p0, v3, v4}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    iget v2, p0, Lhh;->j:I

    .line 20
    .line 21
    int-to-long v7, v2

    .line 22
    add-long/2addr v7, v5

    .line 23
    invoke-virtual {p0}, Lhh;->k()J

    .line 24
    .line 25
    .line 26
    move-result-wide v9

    .line 27
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->max(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v7

    .line 31
    cmp-long v2, p1, v7

    .line 32
    .line 33
    if-gez v2, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-wide/16 v7, 0x1

    .line 37
    .line 38
    add-long/2addr v7, v5

    .line 39
    move-object v2, p0

    .line 40
    invoke-virtual/range {v1 .. v8}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_5

    .line 45
    .line 46
    sget p0, Ljh;->b:I

    .line 47
    .line 48
    int-to-long v3, p0

    .line 49
    div-long v7, v5, v3

    .line 50
    .line 51
    rem-long v3, v5, v3

    .line 52
    .line 53
    long-to-int p0, v3

    .line 54
    iget-wide v3, v0, Lq31;->d:J

    .line 55
    .line 56
    cmp-long v1, v3, v7

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v2, v7, v8, v0}, Lhh;->i(JLtj;)Ltj;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    if-nez v1, :cond_1

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_1
    move-object v0, v1

    .line 68
    :cond_2
    const/4 v10, 0x0

    .line 69
    move v7, p0

    .line 70
    move-wide v8, v5

    .line 71
    move-object v6, v0

    .line 72
    move-object v5, v2

    .line 73
    invoke-virtual/range {v5 .. v10}, Lhh;->D(Ltj;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object v0, Ljh;->o:Log0;

    .line 78
    .line 79
    if-ne p0, v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {v2}, Lhh;->p()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    cmp-long p0, v8, v0

    .line 86
    .line 87
    if-gez p0, :cond_4

    .line 88
    .line 89
    invoke-virtual {v6}, Lsm;->a()V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    invoke-virtual {v6}, Lsm;->a()V

    .line 94
    .line 95
    .line 96
    :cond_4
    :goto_1
    move-object p0, v2

    .line 97
    move-object v0, v6

    .line 98
    goto :goto_0

    .line 99
    :cond_5
    :goto_2
    move-object p0, v2

    .line 100
    goto :goto_0
.end method

.method public final h()V
    .locals 15

    .line 1
    invoke-virtual {p0}, Lhh;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 9
    .line 10
    sget-wide v8, Lhh;->r:J

    .line 11
    .line 12
    invoke-virtual {v0, p0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ltj;

    .line 17
    .line 18
    move-object v10, v0

    .line 19
    :goto_0
    sget-object v0, Lhh;->m:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v11

    .line 25
    sget v0, Ljh;->b:I

    .line 26
    .line 27
    int-to-long v2, v0

    .line 28
    div-long v6, v11, v2

    .line 29
    .line 30
    invoke-virtual {p0}, Lhh;->p()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    cmp-long v0, v2, v11

    .line 35
    .line 36
    if-gtz v0, :cond_2

    .line 37
    .line 38
    iget-wide v2, v10, Lq31;->d:J

    .line 39
    .line 40
    cmp-long v0, v2, v6

    .line 41
    .line 42
    if-gez v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {v10}, Lsm;->b()Lsm;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v6, v7, v10}, Lhh;->x(JLtj;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static {p0}, Lhh;->r(Lhh;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-wide v2, v10, Lq31;->d:J

    .line 58
    .line 59
    cmp-long v0, v2, v6

    .line 60
    .line 61
    if-eqz v0, :cond_c

    .line 62
    .line 63
    sget-object v13, Lih;->r:Lih;

    .line 64
    .line 65
    :goto_1
    invoke-static {v10, v6, v7, v13}, Lqe0;->e(Lq31;JLf90;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v14

    .line 69
    invoke-static {v14}, Lxg;->l(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {v14}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    :cond_3
    :goto_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 80
    .line 81
    invoke-virtual {v0, p0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    move-object v4, v0

    .line 86
    check-cast v4, Lq31;

    .line 87
    .line 88
    iget-wide v2, v4, Lq31;->d:J

    .line 89
    .line 90
    iget-wide v0, v5, Lq31;->d:J

    .line 91
    .line 92
    cmp-long v0, v2, v0

    .line 93
    .line 94
    if-ltz v0, :cond_4

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    invoke-virtual {v5}, Lq31;->i()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_5

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 105
    .line 106
    sget-wide v2, Lhh;->r:J

    .line 107
    .line 108
    move-object v1, p0

    .line 109
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_6

    .line 114
    .line 115
    invoke-virtual {v4}, Lq31;->e()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_7

    .line 120
    .line 121
    invoke-virtual {v4}, Lsm;->d()V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_6
    invoke-virtual {v0, p0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    if-eq v0, v4, :cond_5

    .line 130
    .line 131
    invoke-virtual {v5}, Lq31;->e()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    invoke-virtual {v5}, Lsm;->d()V

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_7
    :goto_3
    invoke-static {v14}, Lxg;->l(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    const/4 v13, 0x0

    .line 146
    if-eqz v0, :cond_8

    .line 147
    .line 148
    invoke-virtual {p0}, Lhh;->u()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v6, v7, v10}, Lhh;->x(JLtj;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p0}, Lhh;->r(Lhh;)V

    .line 155
    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_8
    invoke-static {v14}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Ltj;

    .line 163
    .line 164
    iget-wide v2, v0, Lq31;->d:J

    .line 165
    .line 166
    cmp-long v4, v2, v6

    .line 167
    .line 168
    if-lez v4, :cond_a

    .line 169
    .line 170
    const-wide/16 v4, 0x1

    .line 171
    .line 172
    add-long/2addr v4, v11

    .line 173
    sget v0, Ljh;->b:I

    .line 174
    .line 175
    int-to-long v6, v0

    .line 176
    mul-long/2addr v6, v2

    .line 177
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 178
    .line 179
    sget-wide v2, Lhh;->q:J

    .line 180
    .line 181
    move-object v1, p0

    .line 182
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_9

    .line 187
    .line 188
    sub-long/2addr v6, v11

    .line 189
    invoke-virtual {p0, v6, v7}, Lhh;->q(J)V

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_9
    invoke-static {p0}, Lhh;->r(Lhh;)V

    .line 194
    .line 195
    .line 196
    goto :goto_4

    .line 197
    :cond_a
    move-object v13, v0

    .line 198
    :goto_4
    if-nez v13, :cond_b

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_b
    move-object v10, v13

    .line 203
    :cond_c
    sget v0, Ljh;->b:I

    .line 204
    .line 205
    int-to-long v2, v0

    .line 206
    rem-long v2, v11, v2

    .line 207
    .line 208
    long-to-int v0, v2

    .line 209
    invoke-virtual {v10, v0}, Ltj;->k(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    instance-of v3, v2, Lui1;

    .line 214
    .line 215
    sget-wide v4, Lhh;->v:J

    .line 216
    .line 217
    if-eqz v3, :cond_e

    .line 218
    .line 219
    sget-object v3, Lja;->a:Lsun/misc/Unsafe;

    .line 220
    .line 221
    invoke-virtual {v3, p0, v4, v5}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 222
    .line 223
    .line 224
    move-result-wide v6

    .line 225
    cmp-long v3, v11, v6

    .line 226
    .line 227
    if-ltz v3, :cond_e

    .line 228
    .line 229
    sget-object v3, Ljh;->g:Log0;

    .line 230
    .line 231
    invoke-virtual {v10, v2, v0, v3}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    if-eqz v3, :cond_e

    .line 236
    .line 237
    invoke-static {v2}, Lhh;->C(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    if-eqz v2, :cond_d

    .line 242
    .line 243
    sget-object v2, Ljh;->d:Log0;

    .line 244
    .line 245
    invoke-virtual {v10, v0, v2}, Ltj;->n(ILjava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    goto/16 :goto_7

    .line 249
    .line 250
    :cond_d
    sget-object v2, Ljh;->j:Log0;

    .line 251
    .line 252
    invoke-virtual {v10, v0, v2}, Ltj;->n(ILjava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v10}, Lq31;->h()V

    .line 256
    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_e
    :goto_5
    invoke-virtual {v10, v0}, Ltj;->k(I)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    instance-of v3, v2, Lui1;

    .line 264
    .line 265
    if-eqz v3, :cond_11

    .line 266
    .line 267
    sget-object v3, Lja;->a:Lsun/misc/Unsafe;

    .line 268
    .line 269
    invoke-virtual {v3, p0, v4, v5}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 270
    .line 271
    .line 272
    move-result-wide v6

    .line 273
    cmp-long v3, v11, v6

    .line 274
    .line 275
    if-gez v3, :cond_f

    .line 276
    .line 277
    new-instance v3, Lvi1;

    .line 278
    .line 279
    move-object v6, v2

    .line 280
    check-cast v6, Lui1;

    .line 281
    .line 282
    invoke-direct {v3, v6}, Lvi1;-><init>(Lui1;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v10, v2, v0, v3}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    if-eqz v2, :cond_e

    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_f
    sget-object v3, Ljh;->g:Log0;

    .line 293
    .line 294
    invoke-virtual {v10, v2, v0, v3}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    if-eqz v3, :cond_e

    .line 299
    .line 300
    invoke-static {v2}, Lhh;->C(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    if-eqz v2, :cond_10

    .line 305
    .line 306
    sget-object v2, Ljh;->d:Log0;

    .line 307
    .line 308
    invoke-virtual {v10, v0, v2}, Ltj;->n(ILjava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    goto :goto_7

    .line 312
    :cond_10
    sget-object v2, Ljh;->j:Log0;

    .line 313
    .line 314
    invoke-virtual {v10, v0, v2}, Ltj;->n(ILjava/lang/Object;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v10}, Lq31;->h()V

    .line 318
    .line 319
    .line 320
    goto :goto_6

    .line 321
    :cond_11
    sget-object v3, Ljh;->j:Log0;

    .line 322
    .line 323
    if-ne v2, v3, :cond_12

    .line 324
    .line 325
    :goto_6
    invoke-static {p0}, Lhh;->r(Lhh;)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :cond_12
    if-nez v2, :cond_13

    .line 331
    .line 332
    sget-object v3, Ljh;->e:Log0;

    .line 333
    .line 334
    invoke-virtual {v10, v2, v0, v3}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    move-result v2

    .line 338
    if-eqz v2, :cond_e

    .line 339
    .line 340
    goto :goto_7

    .line 341
    :cond_13
    sget-object v3, Ljh;->d:Log0;

    .line 342
    .line 343
    if-ne v2, v3, :cond_14

    .line 344
    .line 345
    goto :goto_7

    .line 346
    :cond_14
    sget-object v3, Ljh;->h:Log0;

    .line 347
    .line 348
    if-eq v2, v3, :cond_18

    .line 349
    .line 350
    sget-object v3, Ljh;->i:Log0;

    .line 351
    .line 352
    if-eq v2, v3, :cond_18

    .line 353
    .line 354
    sget-object v3, Ljh;->k:Log0;

    .line 355
    .line 356
    if-ne v2, v3, :cond_15

    .line 357
    .line 358
    goto :goto_7

    .line 359
    :cond_15
    sget-object v3, Ljh;->l:Log0;

    .line 360
    .line 361
    if-ne v2, v3, :cond_16

    .line 362
    .line 363
    goto :goto_7

    .line 364
    :cond_16
    sget-object v3, Ljh;->f:Log0;

    .line 365
    .line 366
    if-ne v2, v3, :cond_17

    .line 367
    .line 368
    goto :goto_5

    .line 369
    :cond_17
    const-string v0, "Unexpected cell state: "

    .line 370
    .line 371
    invoke-static {v2, v0}, Lo40;->q(Ljava/lang/Object;Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :cond_18
    :goto_7
    invoke-static {p0}, Lhh;->r(Lhh;)V

    .line 376
    .line 377
    .line 378
    return-void
.end method

.method public final i(JLtj;)Ltj;
    .locals 15

    .line 1
    move-wide/from16 v6, p1

    .line 2
    .line 3
    move-object/from16 v8, p3

    .line 4
    .line 5
    sget-object v0, Ljh;->a:Ltj;

    .line 6
    .line 7
    sget-object v9, Lih;->r:Lih;

    .line 8
    .line 9
    :goto_0
    invoke-static {v8, v6, v7, v9}, Lqe0;->e(Lq31;JLf90;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v10

    .line 13
    invoke-static {v10}, Lxg;->l(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_4

    .line 18
    .line 19
    invoke-static {v10}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    :cond_0
    :goto_1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 24
    .line 25
    sget-wide v11, Lhh;->u:J

    .line 26
    .line 27
    invoke-virtual {v0, p0, v11, v12}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v4, v0

    .line 32
    check-cast v4, Lq31;

    .line 33
    .line 34
    iget-wide v2, v4, Lq31;->d:J

    .line 35
    .line 36
    iget-wide v13, v5, Lq31;->d:J

    .line 37
    .line 38
    cmp-long v0, v2, v13

    .line 39
    .line 40
    if-ltz v0, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    invoke-virtual {v5}, Lq31;->i()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 51
    .line 52
    sget-wide v2, Lhh;->u:J

    .line 53
    .line 54
    move-object v1, p0

    .line 55
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-virtual {v4}, Lq31;->e()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-virtual {v4}, Lsm;->d()V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    invoke-virtual {v0, p0, v11, v12}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eq v0, v4, :cond_2

    .line 76
    .line 77
    invoke-virtual {v5}, Lq31;->e()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    invoke-virtual {v5}, Lsm;->d()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_4
    :goto_2
    invoke-static {v10}, Lxg;->l(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const/4 v9, 0x0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    invoke-virtual {p0}, Lhh;->u()V

    .line 95
    .line 96
    .line 97
    iget-wide v2, v8, Lq31;->d:J

    .line 98
    .line 99
    sget v0, Ljh;->b:I

    .line 100
    .line 101
    int-to-long v4, v0

    .line 102
    mul-long/2addr v2, v4

    .line 103
    invoke-virtual {p0}, Lhh;->p()J

    .line 104
    .line 105
    .line 106
    move-result-wide v0

    .line 107
    cmp-long v0, v2, v0

    .line 108
    .line 109
    if-gez v0, :cond_d

    .line 110
    .line 111
    invoke-virtual {v8}, Lsm;->a()V

    .line 112
    .line 113
    .line 114
    return-object v9

    .line 115
    :cond_5
    invoke-static {v10}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    move-object v5, v0

    .line 120
    check-cast v5, Ltj;

    .line 121
    .line 122
    iget-wide v10, v5, Lq31;->d:J

    .line 123
    .line 124
    invoke-virtual {p0}, Lhh;->w()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_9

    .line 129
    .line 130
    invoke-virtual {p0}, Lhh;->k()J

    .line 131
    .line 132
    .line 133
    move-result-wide v2

    .line 134
    sget v0, Ljh;->b:I

    .line 135
    .line 136
    int-to-long v12, v0

    .line 137
    div-long/2addr v2, v12

    .line 138
    cmp-long v0, v6, v2

    .line 139
    .line 140
    if-gtz v0, :cond_9

    .line 141
    .line 142
    :goto_3
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 143
    .line 144
    sget-wide v12, Lhh;->r:J

    .line 145
    .line 146
    invoke-virtual {v0, p0, v12, v13}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    move-object v4, v0

    .line 151
    check-cast v4, Lq31;

    .line 152
    .line 153
    iget-wide v2, v4, Lq31;->d:J

    .line 154
    .line 155
    cmp-long v0, v2, v10

    .line 156
    .line 157
    if-gez v0, :cond_9

    .line 158
    .line 159
    invoke-virtual {v5}, Lq31;->i()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_9

    .line 164
    .line 165
    :goto_4
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 166
    .line 167
    sget-wide v2, Lhh;->r:J

    .line 168
    .line 169
    move-object v1, p0

    .line 170
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    move-object v8, v5

    .line 175
    if-eqz v2, :cond_6

    .line 176
    .line 177
    invoke-virtual {v4}, Lq31;->e()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_a

    .line 182
    .line 183
    invoke-virtual {v4}, Lsm;->d()V

    .line 184
    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_6
    invoke-virtual {v0, p0, v12, v13}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-eq v0, v4, :cond_8

    .line 192
    .line 193
    invoke-virtual {v8}, Lq31;->e()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_7

    .line 198
    .line 199
    invoke-virtual {v8}, Lsm;->d()V

    .line 200
    .line 201
    .line 202
    :cond_7
    move-object v5, v8

    .line 203
    goto :goto_3

    .line 204
    :cond_8
    move-object v5, v8

    .line 205
    goto :goto_4

    .line 206
    :cond_9
    move-object v8, v5

    .line 207
    :cond_a
    :goto_5
    cmp-long v0, v10, v6

    .line 208
    .line 209
    if-lez v0, :cond_e

    .line 210
    .line 211
    sget v0, Ljh;->b:I

    .line 212
    .line 213
    int-to-long v2, v0

    .line 214
    mul-long v6, v10, v2

    .line 215
    .line 216
    :cond_b
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 217
    .line 218
    sget-wide v2, Lhh;->v:J

    .line 219
    .line 220
    invoke-virtual {v0, p0, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 221
    .line 222
    .line 223
    move-result-wide v4

    .line 224
    cmp-long v12, v4, v6

    .line 225
    .line 226
    if-ltz v12, :cond_c

    .line 227
    .line 228
    goto :goto_6

    .line 229
    :cond_c
    move-object v1, p0

    .line 230
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-eqz v0, :cond_b

    .line 235
    .line 236
    :goto_6
    sget v0, Ljh;->b:I

    .line 237
    .line 238
    int-to-long v0, v0

    .line 239
    mul-long/2addr v10, v0

    .line 240
    invoke-virtual {p0}, Lhh;->p()J

    .line 241
    .line 242
    .line 243
    move-result-wide v0

    .line 244
    cmp-long v0, v10, v0

    .line 245
    .line 246
    if-gez v0, :cond_d

    .line 247
    .line 248
    invoke-virtual {v8}, Lsm;->a()V

    .line 249
    .line 250
    .line 251
    :cond_d
    return-object v9

    .line 252
    :cond_e
    return-object v8
.end method

.method public final j(JLtj;)Ltj;
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-wide/from16 v6, p1

    .line 4
    .line 5
    move-object/from16 v8, p3

    .line 6
    .line 7
    sget-object v0, Ljh;->a:Ltj;

    .line 8
    .line 9
    sget-object v9, Lih;->r:Lih;

    .line 10
    .line 11
    :goto_0
    invoke-static {v8, v6, v7, v9}, Lqe0;->e(Lq31;JLf90;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v10

    .line 15
    invoke-static {v10}, Lxg;->l(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_4

    .line 20
    .line 21
    invoke-static {v10}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    :cond_0
    :goto_1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 26
    .line 27
    sget-wide v11, Lhh;->w:J

    .line 28
    .line 29
    invoke-virtual {v0, v1, v11, v12}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    move-object v4, v0

    .line 34
    check-cast v4, Lq31;

    .line 35
    .line 36
    iget-wide v2, v4, Lq31;->d:J

    .line 37
    .line 38
    iget-wide v13, v5, Lq31;->d:J

    .line 39
    .line 40
    cmp-long v0, v2, v13

    .line 41
    .line 42
    if-ltz v0, :cond_1

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_1
    invoke-virtual {v5}, Lq31;->i()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 53
    .line 54
    sget-wide v2, Lhh;->w:J

    .line 55
    .line 56
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    invoke-virtual {v4}, Lq31;->e()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    invoke-virtual {v4}, Lsm;->d()V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    invoke-virtual {v0, v1, v11, v12}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eq v0, v4, :cond_2

    .line 77
    .line 78
    invoke-virtual {v5}, Lq31;->e()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    invoke-virtual {v5}, Lsm;->d()V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    :goto_2
    invoke-static {v10}, Lxg;->l(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const/4 v9, 0x0

    .line 93
    if-eqz v0, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lhh;->u()V

    .line 96
    .line 97
    .line 98
    iget-wide v2, v8, Lq31;->d:J

    .line 99
    .line 100
    sget v0, Ljh;->b:I

    .line 101
    .line 102
    int-to-long v4, v0

    .line 103
    mul-long/2addr v2, v4

    .line 104
    invoke-virtual {v1}, Lhh;->n()J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    cmp-long v0, v2, v0

    .line 109
    .line 110
    if-gez v0, :cond_5

    .line 111
    .line 112
    invoke-virtual {v8}, Lsm;->a()V

    .line 113
    .line 114
    .line 115
    return-object v9

    .line 116
    :cond_5
    move-object v15, v9

    .line 117
    goto :goto_5

    .line 118
    :cond_6
    invoke-static {v10}, Lxg;->j(Ljava/lang/Object;)Lq31;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    move-object v8, v0

    .line 123
    check-cast v8, Ltj;

    .line 124
    .line 125
    iget-wide v10, v8, Lq31;->d:J

    .line 126
    .line 127
    cmp-long v0, v10, v6

    .line 128
    .line 129
    if-lez v0, :cond_a

    .line 130
    .line 131
    sget v0, Ljh;->b:I

    .line 132
    .line 133
    int-to-long v2, v0

    .line 134
    mul-long v12, v10, v2

    .line 135
    .line 136
    :goto_3
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 137
    .line 138
    sget-wide v2, Lhh;->x:J

    .line 139
    .line 140
    invoke-virtual {v0, v1, v2, v3}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 141
    .line 142
    .line 143
    move-result-wide v4

    .line 144
    const-wide v6, 0xfffffffffffffffL

    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    and-long/2addr v6, v4

    .line 150
    cmp-long v14, v6, v12

    .line 151
    .line 152
    if-ltz v14, :cond_7

    .line 153
    .line 154
    move-object v15, v9

    .line 155
    move-wide/from16 v16, v10

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_7
    const/16 v14, 0x3c

    .line 159
    .line 160
    move-object v15, v9

    .line 161
    move-wide/from16 v16, v10

    .line 162
    .line 163
    shr-long v9, v4, v14

    .line 164
    .line 165
    long-to-int v9, v9

    .line 166
    int-to-long v9, v9

    .line 167
    shl-long/2addr v9, v14

    .line 168
    add-long/2addr v6, v9

    .line 169
    invoke-virtual/range {v0 .. v7}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_9

    .line 174
    .line 175
    :goto_4
    sget v0, Ljh;->b:I

    .line 176
    .line 177
    int-to-long v0, v0

    .line 178
    mul-long v10, v16, v0

    .line 179
    .line 180
    invoke-virtual/range {p0 .. p0}, Lhh;->n()J

    .line 181
    .line 182
    .line 183
    move-result-wide v0

    .line 184
    cmp-long v0, v10, v0

    .line 185
    .line 186
    if-gez v0, :cond_8

    .line 187
    .line 188
    invoke-virtual {v8}, Lsm;->a()V

    .line 189
    .line 190
    .line 191
    :cond_8
    :goto_5
    return-object v15

    .line 192
    :cond_9
    move-object/from16 v1, p0

    .line 193
    .line 194
    move-object v9, v15

    .line 195
    move-wide/from16 v10, v16

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_a
    return-object v8
.end method

.method public final k()J
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->q:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final l()Ljava/lang/Throwable;
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->p:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Throwable;

    .line 10
    .line 11
    return-object p0
.end method

.method public final m()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lhh;->l()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lrk;

    .line 8
    .line 9
    const-string v0, "Channel was closed"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public final n()J
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->v:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final o()Ljava/lang/Throwable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lhh;->l()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lsk;

    .line 8
    .line 9
    const-string v0, "Channel was closed"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public final p()J
    .locals 4

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->x:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide v2, 0xfffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v0, v2

    .line 15
    return-wide v0
.end method

.method public final q(J)V
    .locals 6

    .line 1
    sget-object v0, Lhh;->n:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 8
    .line 9
    and-long/2addr p1, v0

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    cmp-long p1, p1, v2

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    :goto_0
    sget-object p1, Lja;->a:Lsun/misc/Unsafe;

    .line 17
    .line 18
    sget-wide v4, Lhh;->t:J

    .line 19
    .line 20
    invoke-virtual {p1, p0, v4, v5}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 21
    .line 22
    .line 23
    move-result-wide p1

    .line 24
    and-long/2addr p1, v0

    .line 25
    cmp-long p1, p1, v2

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public final s(ZJ)Z
    .locals 11

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    shr-long v0, p2, v0

    .line 4
    .line 5
    long-to-int v0, v0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_1d

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v2, :cond_1d

    .line 11
    .line 12
    const/4 v3, 0x2

    .line 13
    const-wide v4, 0xfffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    if-eq v0, v3, :cond_d

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-ne v0, p1, :cond_c

    .line 22
    .line 23
    and-long p1, p2, v4

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lhh;->d(J)Ltj;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x0

    .line 30
    move-object p3, p2

    .line 31
    :cond_0
    sget v0, Ljh;->b:I

    .line 32
    .line 33
    sub-int/2addr v0, v2

    .line 34
    :goto_0
    const/4 v3, -0x1

    .line 35
    if-ge v3, v0, :cond_9

    .line 36
    .line 37
    iget-wide v4, p1, Lq31;->d:J

    .line 38
    .line 39
    sget v6, Ljh;->b:I

    .line 40
    .line 41
    int-to-long v6, v6

    .line 42
    mul-long/2addr v4, v6

    .line 43
    int-to-long v6, v0

    .line 44
    add-long/2addr v4, v6

    .line 45
    :cond_1
    invoke-virtual {p1, v0}, Ltj;->k(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    sget-object v7, Ljh;->i:Log0;

    .line 50
    .line 51
    if-eq v6, v7, :cond_a

    .line 52
    .line 53
    sget-object v7, Ljh;->d:Log0;

    .line 54
    .line 55
    if-ne v6, v7, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Lhh;->n()J

    .line 58
    .line 59
    .line 60
    move-result-wide v7

    .line 61
    cmp-long v7, v4, v7

    .line 62
    .line 63
    if-ltz v7, :cond_a

    .line 64
    .line 65
    sget-object v7, Ljh;->l:Log0;

    .line 66
    .line 67
    invoke-virtual {p1, v6, v0, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-eqz v6, :cond_1

    .line 72
    .line 73
    invoke-virtual {p1, v0, p2}, Ltj;->m(ILjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Lq31;->h()V

    .line 77
    .line 78
    .line 79
    goto :goto_4

    .line 80
    :cond_2
    sget-object v7, Ljh;->e:Log0;

    .line 81
    .line 82
    if-eq v6, v7, :cond_8

    .line 83
    .line 84
    if-nez v6, :cond_3

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_3
    instance-of v7, v6, Lui1;

    .line 88
    .line 89
    if-nez v7, :cond_6

    .line 90
    .line 91
    instance-of v7, v6, Lvi1;

    .line 92
    .line 93
    if-eqz v7, :cond_4

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    sget-object v7, Ljh;->g:Log0;

    .line 97
    .line 98
    if-eq v6, v7, :cond_a

    .line 99
    .line 100
    sget-object v8, Ljh;->f:Log0;

    .line 101
    .line 102
    if-ne v6, v8, :cond_5

    .line 103
    .line 104
    goto :goto_5

    .line 105
    :cond_5
    if-eq v6, v7, :cond_1

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lhh;->n()J

    .line 109
    .line 110
    .line 111
    move-result-wide v7

    .line 112
    cmp-long v7, v4, v7

    .line 113
    .line 114
    if-ltz v7, :cond_a

    .line 115
    .line 116
    instance-of v7, v6, Lvi1;

    .line 117
    .line 118
    if-eqz v7, :cond_7

    .line 119
    .line 120
    move-object v7, v6

    .line 121
    check-cast v7, Lvi1;

    .line 122
    .line 123
    iget-object v7, v7, Lvi1;->a:Lui1;

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_7
    move-object v7, v6

    .line 127
    check-cast v7, Lui1;

    .line 128
    .line 129
    :goto_2
    sget-object v8, Ljh;->l:Log0;

    .line 130
    .line 131
    invoke-virtual {p1, v6, v0, v8}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    if-eqz v6, :cond_1

    .line 136
    .line 137
    invoke-static {p3, v7}, Lst;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-virtual {p1, v0, p2}, Ltj;->m(ILjava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Lq31;->h()V

    .line 145
    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_8
    :goto_3
    sget-object v7, Ljh;->l:Log0;

    .line 149
    .line 150
    invoke-virtual {p1, v6, v0, v7}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    if-eqz v6, :cond_1

    .line 155
    .line 156
    invoke-virtual {p1}, Lq31;->h()V

    .line 157
    .line 158
    .line 159
    :goto_4
    add-int/lit8 v0, v0, -0x1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_9
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 163
    .line 164
    sget-wide v4, Lsm;->b:J

    .line 165
    .line 166
    invoke-virtual {v0, p1, v4, v5}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, Lsm;

    .line 171
    .line 172
    check-cast p1, Ltj;

    .line 173
    .line 174
    if-nez p1, :cond_0

    .line 175
    .line 176
    :cond_a
    :goto_5
    if-eqz p3, :cond_1c

    .line 177
    .line 178
    instance-of p1, p3, Ljava/util/ArrayList;

    .line 179
    .line 180
    if-nez p1, :cond_b

    .line 181
    .line 182
    check-cast p3, Lui1;

    .line 183
    .line 184
    invoke-virtual {p0, p3, v1}, Lhh;->A(Lui1;Z)V

    .line 185
    .line 186
    .line 187
    goto/16 :goto_a

    .line 188
    .line 189
    :cond_b
    check-cast p3, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    sub-int/2addr p1, v2

    .line 196
    :goto_6
    if-ge v3, p1, :cond_1c

    .line 197
    .line 198
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    check-cast p2, Lui1;

    .line 203
    .line 204
    invoke-virtual {p0, p2, v1}, Lhh;->A(Lui1;Z)V

    .line 205
    .line 206
    .line 207
    add-int/lit8 p1, p1, -0x1

    .line 208
    .line 209
    goto :goto_6

    .line 210
    :cond_c
    const-string p0, "unexpected close status: "

    .line 211
    .line 212
    invoke-static {v0, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 217
    .line 218
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw p1

    .line 226
    :cond_d
    and-long/2addr p2, v4

    .line 227
    invoke-virtual {p0, p2, p3}, Lhh;->d(J)Ltj;

    .line 228
    .line 229
    .line 230
    if-eqz p1, :cond_1c

    .line 231
    .line 232
    :cond_e
    :goto_7
    sget-object p1, Lja;->a:Lsun/misc/Unsafe;

    .line 233
    .line 234
    sget-wide p2, Lhh;->u:J

    .line 235
    .line 236
    invoke-virtual {p1, p0, p2, p3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    check-cast v0, Ltj;

    .line 241
    .line 242
    invoke-virtual {p0}, Lhh;->n()J

    .line 243
    .line 244
    .line 245
    move-result-wide v7

    .line 246
    invoke-virtual {p0}, Lhh;->p()J

    .line 247
    .line 248
    .line 249
    move-result-wide v3

    .line 250
    cmp-long v3, v3, v7

    .line 251
    .line 252
    if-gtz v3, :cond_f

    .line 253
    .line 254
    goto/16 :goto_a

    .line 255
    .line 256
    :cond_f
    sget v3, Ljh;->b:I

    .line 257
    .line 258
    int-to-long v3, v3

    .line 259
    div-long v5, v7, v3

    .line 260
    .line 261
    iget-wide v9, v0, Lq31;->d:J

    .line 262
    .line 263
    cmp-long v9, v9, v5

    .line 264
    .line 265
    if-eqz v9, :cond_10

    .line 266
    .line 267
    invoke-virtual {p0, v5, v6, v0}, Lhh;->i(JLtj;)Ltj;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    if-nez v0, :cond_10

    .line 272
    .line 273
    invoke-virtual {p1, p0, p2, p3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    check-cast p1, Ltj;

    .line 278
    .line 279
    iget-wide p1, p1, Lq31;->d:J

    .line 280
    .line 281
    cmp-long p1, p1, v5

    .line 282
    .line 283
    if-gez p1, :cond_e

    .line 284
    .line 285
    goto :goto_a

    .line 286
    :cond_10
    invoke-virtual {v0}, Lsm;->a()V

    .line 287
    .line 288
    .line 289
    rem-long p1, v7, v3

    .line 290
    .line 291
    long-to-int p1, p1

    .line 292
    :cond_11
    invoke-virtual {v0, p1}, Ltj;->k(I)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object p2

    .line 296
    if-eqz p2, :cond_1a

    .line 297
    .line 298
    sget-object p3, Ljh;->e:Log0;

    .line 299
    .line 300
    if-ne p2, p3, :cond_12

    .line 301
    .line 302
    goto :goto_8

    .line 303
    :cond_12
    sget-object p1, Ljh;->d:Log0;

    .line 304
    .line 305
    if-ne p2, p1, :cond_13

    .line 306
    .line 307
    goto :goto_b

    .line 308
    :cond_13
    sget-object p1, Ljh;->j:Log0;

    .line 309
    .line 310
    if-ne p2, p1, :cond_14

    .line 311
    .line 312
    goto :goto_9

    .line 313
    :cond_14
    sget-object p1, Ljh;->l:Log0;

    .line 314
    .line 315
    if-ne p2, p1, :cond_15

    .line 316
    .line 317
    goto :goto_9

    .line 318
    :cond_15
    sget-object p1, Ljh;->i:Log0;

    .line 319
    .line 320
    if-ne p2, p1, :cond_16

    .line 321
    .line 322
    goto :goto_9

    .line 323
    :cond_16
    sget-object p1, Ljh;->h:Log0;

    .line 324
    .line 325
    if-ne p2, p1, :cond_17

    .line 326
    .line 327
    goto :goto_9

    .line 328
    :cond_17
    sget-object p1, Ljh;->g:Log0;

    .line 329
    .line 330
    if-ne p2, p1, :cond_18

    .line 331
    .line 332
    goto :goto_b

    .line 333
    :cond_18
    sget-object p1, Ljh;->f:Log0;

    .line 334
    .line 335
    if-ne p2, p1, :cond_19

    .line 336
    .line 337
    goto :goto_9

    .line 338
    :cond_19
    invoke-virtual {p0}, Lhh;->n()J

    .line 339
    .line 340
    .line 341
    move-result-wide p1

    .line 342
    cmp-long p1, v7, p1

    .line 343
    .line 344
    if-nez p1, :cond_1b

    .line 345
    .line 346
    goto :goto_b

    .line 347
    :cond_1a
    :goto_8
    sget-object p3, Ljh;->h:Log0;

    .line 348
    .line 349
    invoke-virtual {v0, p2, p1, p3}, Ltj;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result p2

    .line 353
    if-eqz p2, :cond_11

    .line 354
    .line 355
    invoke-virtual {p0}, Lhh;->h()V

    .line 356
    .line 357
    .line 358
    :cond_1b
    :goto_9
    const-wide/16 p1, 0x1

    .line 359
    .line 360
    add-long v9, v7, p1

    .line 361
    .line 362
    sget-object v3, Lja;->a:Lsun/misc/Unsafe;

    .line 363
    .line 364
    sget-wide v5, Lhh;->v:J

    .line 365
    .line 366
    move-object v4, p0

    .line 367
    invoke-virtual/range {v3 .. v10}, Lsun/misc/Unsafe;->compareAndSwapLong(Ljava/lang/Object;JJJ)Z

    .line 368
    .line 369
    .line 370
    goto/16 :goto_7

    .line 371
    .line 372
    :cond_1c
    :goto_a
    return v2

    .line 373
    :cond_1d
    :goto_b
    return v1
.end method

.method public final t()Z
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->x:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p0, v2, v0, v1}, Lhh;->s(ZJ)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lja;->a:Lsun/misc/Unsafe;

    .line 9
    .line 10
    sget-wide v3, Lhh;->x:J

    .line 11
    .line 12
    invoke-virtual {v2, v0, v3, v4}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    const/16 v5, 0x3c

    .line 17
    .line 18
    shr-long/2addr v3, v5

    .line 19
    long-to-int v3, v3

    .line 20
    const/4 v4, 0x3

    .line 21
    const/4 v5, 0x2

    .line 22
    if-eq v3, v5, :cond_1

    .line 23
    .line 24
    if-eq v3, v4, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v3, "cancelled,"

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string v3, "closed,"

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v6, "capacity="

    .line 41
    .line 42
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget v6, v0, Lhh;->j:I

    .line 46
    .line 47
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const/16 v6, 0x2c

    .line 51
    .line 52
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v3, "data=["

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    new-array v3, v4, [Ltj;

    .line 68
    .line 69
    sget-wide v7, Lhh;->u:J

    .line 70
    .line 71
    invoke-virtual {v2, v0, v7, v8}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const/4 v7, 0x0

    .line 76
    aput-object v4, v3, v7

    .line 77
    .line 78
    sget-wide v8, Lhh;->w:J

    .line 79
    .line 80
    invoke-virtual {v2, v0, v8, v9}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    const/4 v8, 0x1

    .line 85
    aput-object v4, v3, v8

    .line 86
    .line 87
    sget-wide v9, Lhh;->r:J

    .line 88
    .line 89
    invoke-virtual {v2, v0, v9, v10}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    aput-object v2, v3, v5

    .line 94
    .line 95
    invoke-static {v3}, Lcl;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    new-instance v3, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_3

    .line 113
    .line 114
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    move-object v5, v4

    .line 119
    check-cast v5, Ltj;

    .line 120
    .line 121
    sget-object v9, Ljh;->a:Ltj;

    .line 122
    .line 123
    if-eq v5, v9, :cond_2

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_16

    .line 138
    .line 139
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    if-nez v4, :cond_4

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_4
    move-object v4, v3

    .line 151
    check-cast v4, Ltj;

    .line 152
    .line 153
    iget-wide v4, v4, Lq31;->d:J

    .line 154
    .line 155
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    move-object v10, v9

    .line 160
    check-cast v10, Ltj;

    .line 161
    .line 162
    iget-wide v10, v10, Lq31;->d:J

    .line 163
    .line 164
    cmp-long v12, v4, v10

    .line 165
    .line 166
    if-lez v12, :cond_6

    .line 167
    .line 168
    move-object v3, v9

    .line 169
    move-wide v4, v10

    .line 170
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 171
    .line 172
    .line 173
    move-result v9

    .line 174
    if-nez v9, :cond_5

    .line 175
    .line 176
    :goto_2
    check-cast v3, Ltj;

    .line 177
    .line 178
    invoke-virtual {v0}, Lhh;->n()J

    .line 179
    .line 180
    .line 181
    move-result-wide v9

    .line 182
    invoke-virtual {v0}, Lhh;->p()J

    .line 183
    .line 184
    .line 185
    move-result-wide v11

    .line 186
    :goto_3
    sget v0, Ljh;->b:I

    .line 187
    .line 188
    move v2, v7

    .line 189
    :goto_4
    if-ge v2, v0, :cond_11

    .line 190
    .line 191
    iget-wide v4, v3, Lq31;->d:J

    .line 192
    .line 193
    sget v13, Ljh;->b:I

    .line 194
    .line 195
    int-to-long v13, v13

    .line 196
    mul-long/2addr v4, v13

    .line 197
    int-to-long v13, v2

    .line 198
    add-long/2addr v4, v13

    .line 199
    cmp-long v13, v4, v11

    .line 200
    .line 201
    if-ltz v13, :cond_7

    .line 202
    .line 203
    cmp-long v14, v4, v9

    .line 204
    .line 205
    if-gez v14, :cond_12

    .line 206
    .line 207
    :cond_7
    invoke-virtual {v3, v2}, Ltj;->k(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v14

    .line 211
    iget-object v15, v3, Ltj;->h:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 212
    .line 213
    mul-int/lit8 v7, v2, 0x2

    .line 214
    .line 215
    invoke-virtual {v15, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    instance-of v15, v14, Lti;

    .line 220
    .line 221
    if-eqz v15, :cond_a

    .line 222
    .line 223
    cmp-long v4, v4, v9

    .line 224
    .line 225
    if-gez v4, :cond_8

    .line 226
    .line 227
    if-ltz v13, :cond_8

    .line 228
    .line 229
    const-string v4, "receive"

    .line 230
    .line 231
    goto/16 :goto_6

    .line 232
    .line 233
    :cond_8
    if-gez v13, :cond_9

    .line 234
    .line 235
    if-ltz v4, :cond_9

    .line 236
    .line 237
    const-string v4, "send"

    .line 238
    .line 239
    goto :goto_6

    .line 240
    :cond_9
    const-string v4, "cont"

    .line 241
    .line 242
    goto :goto_6

    .line 243
    :cond_a
    instance-of v4, v14, Lvi1;

    .line 244
    .line 245
    if-eqz v4, :cond_b

    .line 246
    .line 247
    new-instance v4, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    const-string v5, "EB("

    .line 250
    .line 251
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const/16 v5, 0x29

    .line 258
    .line 259
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    goto :goto_6

    .line 267
    :cond_b
    sget-object v4, Ljh;->f:Log0;

    .line 268
    .line 269
    invoke-static {v14, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    if-nez v4, :cond_e

    .line 274
    .line 275
    sget-object v4, Ljh;->g:Log0;

    .line 276
    .line 277
    invoke-static {v14, v4}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    if-eqz v4, :cond_c

    .line 282
    .line 283
    goto :goto_5

    .line 284
    :cond_c
    if-eqz v14, :cond_10

    .line 285
    .line 286
    sget-object v4, Ljh;->e:Log0;

    .line 287
    .line 288
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-nez v4, :cond_10

    .line 293
    .line 294
    sget-object v4, Ljh;->i:Log0;

    .line 295
    .line 296
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-nez v4, :cond_10

    .line 301
    .line 302
    sget-object v4, Ljh;->h:Log0;

    .line 303
    .line 304
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    if-nez v4, :cond_10

    .line 309
    .line 310
    sget-object v4, Ljh;->k:Log0;

    .line 311
    .line 312
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v4

    .line 316
    if-nez v4, :cond_10

    .line 317
    .line 318
    sget-object v4, Ljh;->j:Log0;

    .line 319
    .line 320
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 321
    .line 322
    .line 323
    move-result v4

    .line 324
    if-nez v4, :cond_10

    .line 325
    .line 326
    sget-object v4, Ljh;->l:Log0;

    .line 327
    .line 328
    invoke-virtual {v14, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    if-eqz v4, :cond_d

    .line 333
    .line 334
    goto :goto_7

    .line 335
    :cond_d
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    goto :goto_6

    .line 340
    :cond_e
    :goto_5
    const-string v4, "resuming_sender"

    .line 341
    .line 342
    :goto_6
    if-eqz v7, :cond_f

    .line 343
    .line 344
    new-instance v5, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    const-string v13, "("

    .line 347
    .line 348
    invoke-direct {v5, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v4, "),"

    .line 361
    .line 362
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    goto :goto_7

    .line 373
    :cond_f
    new-instance v5, Ljava/lang/StringBuilder;

    .line 374
    .line 375
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 376
    .line 377
    .line 378
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v4

    .line 388
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    :cond_10
    :goto_7
    add-int/lit8 v2, v2, 0x1

    .line 392
    .line 393
    const/4 v7, 0x0

    .line 394
    goto/16 :goto_4

    .line 395
    .line 396
    :cond_11
    invoke-virtual {v3}, Lsm;->b()Lsm;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    move-object v3, v0

    .line 401
    check-cast v3, Ltj;

    .line 402
    .line 403
    if-nez v3, :cond_15

    .line 404
    .line 405
    :cond_12
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    if-eqz v0, :cond_14

    .line 410
    .line 411
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    sub-int/2addr v0, v8

    .line 416
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    if-ne v0, v6, :cond_13

    .line 421
    .line 422
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    sub-int/2addr v0, v8

    .line 427
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 432
    .line 433
    .line 434
    :cond_13
    const-string v0, "]"

    .line 435
    .line 436
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    return-object v0

    .line 444
    :cond_14
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 445
    .line 446
    const-string v1, "Char sequence is empty."

    .line 447
    .line 448
    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    throw v0

    .line 452
    :cond_15
    const/4 v7, 0x0

    .line 453
    goto/16 :goto_3

    .line 454
    .line 455
    :cond_16
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 456
    .line 457
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 458
    .line 459
    .line 460
    throw v0
.end method

.method public final u()V
    .locals 3

    .line 1
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lhh;->x:J

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLongVolatile(Ljava/lang/Object;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v2, v0, v1}, Lhh;->s(ZJ)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final w()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lhh;->k()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const-wide v2, 0x7fffffffffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long p0, v0, v2

    .line 17
    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public final x(JLtj;)V
    .locals 6

    .line 1
    :goto_0
    iget-wide v0, p3, Lq31;->d:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-gez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p3}, Lsm;->b()Lsm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ltj;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    move-object p3, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    :goto_1
    move-object v5, p3

    .line 19
    :goto_2
    invoke-virtual {v5}, Lq31;->c()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    invoke-virtual {v5}, Lsm;->b()Lsm;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ltj;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    goto :goto_3

    .line 34
    :cond_2
    move-object v5, p1

    .line 35
    goto :goto_2

    .line 36
    :cond_3
    :goto_3
    sget-object p1, Lja;->a:Lsun/misc/Unsafe;

    .line 37
    .line 38
    sget-wide p2, Lhh;->r:J

    .line 39
    .line 40
    invoke-virtual {p1, p0, p2, p3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    move-object v4, p1

    .line 45
    check-cast v4, Lq31;

    .line 46
    .line 47
    iget-wide v0, v4, Lq31;->d:J

    .line 48
    .line 49
    iget-wide v2, v5, Lq31;->d:J

    .line 50
    .line 51
    cmp-long p1, v0, v2

    .line 52
    .line 53
    if-ltz p1, :cond_4

    .line 54
    .line 55
    goto :goto_5

    .line 56
    :cond_4
    invoke-virtual {v5}, Lq31;->i()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    move-object p3, v5

    .line 63
    goto :goto_1

    .line 64
    :cond_5
    :goto_4
    sget-object v0, Lja;->a:Lsun/misc/Unsafe;

    .line 65
    .line 66
    sget-wide v2, Lhh;->r:J

    .line 67
    .line 68
    move-object v1, p0

    .line 69
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->compareAndSwapObject(Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    invoke-virtual {v4}, Lq31;->e()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    invoke-virtual {v4}, Lsm;->d()V

    .line 82
    .line 83
    .line 84
    :cond_6
    :goto_5
    return-void

    .line 85
    :cond_7
    invoke-virtual {v0, v1, p2, p3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-eq p0, v4, :cond_9

    .line 90
    .line 91
    invoke-virtual {v5}, Lq31;->e()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_8

    .line 96
    .line 97
    invoke-virtual {v5}, Lsm;->d()V

    .line 98
    .line 99
    .line 100
    :cond_8
    move-object p0, v1

    .line 101
    goto :goto_3

    .line 102
    :cond_9
    move-object p0, v1

    .line 103
    goto :goto_4
.end method

.method public final y(Liq;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance p2, Lvi;

    .line 2
    .line 3
    invoke-static {p1}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p2, v0, p1}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lhh;->o()Ljava/lang/Throwable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Lj11;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Lvi;->s()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object p1, Lar;->j:Lar;

    .line 31
    .line 32
    if-ne p0, p1, :cond_0

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 36
    .line 37
    return-object p0
.end method

.method public final z(Ljava/lang/Object;Lvi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lhh;->o()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lj11;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lj11;-><init>(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p1}, Lvi;->d(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
