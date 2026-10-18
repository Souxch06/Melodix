.class public abstract Lbb0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static b:Z

.field public static c:Z

.field public static final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static final synthetic e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lbb0;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lbb0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 5

    .line 1
    sget-boolean v0, Lbb0;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    :try_start_0
    invoke-static {p0}, Lal1;->a(Landroid/content/Context;)Lb00;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v4, 0x1c

    .line 14
    .line 15
    if-lt v3, v4, :cond_0

    .line 16
    .line 17
    const v3, 0x8000040

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/16 v3, 0x40

    .line 22
    .line 23
    :goto_0
    const-string v4, "com.google.android.gms"

    .line 24
    .line 25
    invoke-virtual {v0, v3, v4}, Lb00;->b(ILjava/lang/String;)Landroid/content/pm/PackageInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0}, Lcb0;->a(Landroid/content/Context;)Lcb0;

    .line 30
    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {v0, v1}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    invoke-static {v0, v2}, Lcb0;->d(Landroid/content/pm/PackageInfo;Z)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    sput-boolean v2, Lbb0;->b:Z

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    sput-boolean v1, Lbb0;->b:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    :goto_1
    sput-boolean v2, Lbb0;->c:Z

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :goto_2
    sput-boolean v2, Lbb0;->c:Z

    .line 57
    .line 58
    throw p0

    .line 59
    :catch_0
    sput-boolean v2, Lbb0;->c:Z

    .line 60
    .line 61
    :cond_2
    :goto_3
    sget-boolean p0, Lbb0;->b:Z

    .line 62
    .line 63
    if-nez p0, :cond_4

    .line 64
    .line 65
    const-string p0, "user"

    .line 66
    .line 67
    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_3

    .line 74
    .line 75
    goto :goto_4

    .line 76
    :cond_3
    return v1

    .line 77
    :cond_4
    :goto_4
    return v2
.end method
