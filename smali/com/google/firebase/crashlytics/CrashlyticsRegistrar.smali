.class public Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# static fields
.field public static final synthetic d:I


# instance fields
.field public final a:Lsw0;

.field public final b:Lsw0;

.field public final c:Lsw0;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    sget-object v0, Ll50;->b:Ljava/util/Map;

    .line 2
    .line 3
    sget-object v1, Lh51;->j:Lh51;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v2, Lj50;

    .line 16
    .line 17
    new-instance v3, Lzo0;

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    invoke-direct {v3, v4}, Lzo0;-><init>(Z)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v2, v3}, Lj50;-><init>(Lzo0;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lsw0;

    .line 5
    .line 6
    const-class v1, Lwf;

    .line 7
    .line 8
    const-class v2, Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->a:Lsw0;

    .line 14
    .line 15
    new-instance v0, Lsw0;

    .line 16
    .line 17
    const-class v1, Lqg;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->b:Lsw0;

    .line 23
    .line 24
    new-instance v0, Lsw0;

    .line 25
    .line 26
    const-class v1, Lfi0;

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Lsw0;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->c:Lsw0;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final getComponents()Ljava/util/List;
    .locals 6

    .line 1
    const-class v0, Lv30;

    .line 2
    .line 3
    invoke-static {v0}, Lwl;->b(Ljava/lang/Class;)Lvl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "fire-cls"

    .line 8
    .line 9
    iput-object v1, v0, Lvl;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-class v2, Lu30;

    .line 12
    .line 13
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 18
    .line 19
    .line 20
    const-class v2, Lh40;

    .line 21
    .line 22
    invoke-static {v2}, Lbx;->b(Ljava/lang/Class;)Lbx;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Lbx;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->a:Lsw0;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    const/4 v5, 0x0

    .line 35
    invoke-direct {v2, v3, v4, v5}, Lbx;-><init>(Lsw0;II)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Lbx;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->b:Lsw0;

    .line 44
    .line 45
    invoke-direct {v2, v3, v4, v5}, Lbx;-><init>(Lsw0;II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Lbx;

    .line 52
    .line 53
    iget-object v3, p0, Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;->c:Lsw0;

    .line 54
    .line 55
    invoke-direct {v2, v3, v4, v5}, Lbx;-><init>(Lsw0;II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Lbx;

    .line 62
    .line 63
    const/4 v3, 0x2

    .line 64
    const-class v4, Ltr;

    .line 65
    .line 66
    invoke-direct {v2, v5, v3, v4}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 70
    .line 71
    .line 72
    new-instance v2, Lbx;

    .line 73
    .line 74
    const-class v4, Lj4;

    .line 75
    .line 76
    invoke-direct {v2, v5, v3, v4}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 80
    .line 81
    .line 82
    new-instance v2, Lbx;

    .line 83
    .line 84
    const-class v4, La50;

    .line 85
    .line 86
    invoke-direct {v2, v5, v3, v4}, Lbx;-><init>(IILjava/lang/Class;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Lvl;->a(Lbx;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Lfj;

    .line 93
    .line 94
    const/4 v3, 0x3

    .line 95
    invoke-direct {v2, v3, p0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iput-object v2, v0, Lvl;->f:Ljm;

    .line 99
    .line 100
    invoke-virtual {v0}, Lvl;->c()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Lvl;->b()Lwl;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v0, "20.0.5"

    .line 108
    .line 109
    invoke-static {v1, v0}, Lju1;->j(Ljava/lang/String;Ljava/lang/String;)Lwl;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    filled-new-array {p0, v0}, [Lwl;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method
