.class public final Lf50;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lu30;

.field public final b:Ll51;


# direct methods
.method public constructor <init>(Lu30;Ll51;Lsq;Lj51;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lf50;->a:Lu30;

    .line 17
    .line 18
    iput-object p2, p0, Lf50;->b:Ll51;

    .line 19
    .line 20
    invoke-virtual {p1}, Lu30;->a()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Lu30;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    instance-of p2, p1, Landroid/app/Application;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    check-cast p1, Landroid/app/Application;

    .line 34
    .line 35
    invoke-virtual {p1, p4}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p3}, Lfe1;->b(Lsq;)Lgq;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Loj;

    .line 43
    .line 44
    const/4 p3, 0x0

    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-direct {p2, p0, p4, p3, v0}, Loj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Liq;I)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, p2}, Lju1;->p(Lzq;Lf90;)Ln91;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    return-void
.end method
