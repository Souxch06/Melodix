.class public abstract Lhd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final synthetic a:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-class v0, Landroid/os/Trace;

    .line 8
    .line 9
    const-string v1, "TRACE_TAG_APP"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    .line 17
    .line 18
    .line 19
    const-string v1, "isTagEnabled"

    .line 20
    .line 21
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 22
    .line 23
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 28
    .line 29
    .line 30
    const-string v1, "asyncTraceBegin"

    .line 31
    .line 32
    const-class v3, Ljava/lang/String;

    .line 33
    .line 34
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 35
    .line 36
    filled-new-array {v2, v3, v4}, [Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 41
    .line 42
    .line 43
    const-string v1, "asyncTraceEnd"

    .line 44
    .line 45
    filled-new-array {v2, v3, v4}, [Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 50
    .line 51
    .line 52
    const-string v1, "traceCounter"

    .line 53
    .line 54
    filled-new-array {v2, v3, v4}, [Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :catch_0
    :cond_0
    return-void
.end method
