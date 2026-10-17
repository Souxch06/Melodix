.class public final Lys;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field public final a:Lpa0;

.field public final b:Ldn;

.field public final c:Ljava/lang/Thread$UncaughtExceptionHandler;

.field public final d:Ltr;

.field public final e:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lpa0;Ldn;Ljava/lang/Thread$UncaughtExceptionHandler;Ltr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lys;->a:Lpa0;

    .line 5
    .line 6
    iput-object p2, p0, Lys;->b:Ldn;

    .line 7
    .line 8
    iput-object p3, p0, Lys;->c:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 9
    .line 10
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lys;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    iput-object p4, p0, Lys;->d:Ltr;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lys;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Lys;->c:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    if-nez p2, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    :try_start_0
    iget-object v4, p0, Lys;->d:Ltr;

    .line 17
    .line 18
    invoke-virtual {v4}, Ltr;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    iget-object v4, p0, Lys;->a:Lpa0;

    .line 26
    .line 27
    iget-object p0, p0, Lys;->b:Ldn;

    .line 28
    .line 29
    invoke-virtual {v4, p0, p1, p2}, Lpa0;->s(Ldn;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    :goto_0
    if-eqz v2, :cond_3

    .line 33
    .line 34
    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 39
    .line 40
    .line 41
    :goto_1
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    if-eqz v2, :cond_4

    .line 47
    .line 48
    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_4
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 53
    .line 54
    .line 55
    :goto_2
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 56
    .line 57
    .line 58
    throw p0

    .line 59
    :catch_0
    if-eqz v2, :cond_5

    .line 60
    .line 61
    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_5
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 66
    .line 67
    .line 68
    :goto_3
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
