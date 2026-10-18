.class public final Lb40;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lon;


# instance fields
.field public final synthetic a:Lv40;

.field public final synthetic b:Landroid/content/ContextWrapper;


# direct methods
.method public constructor <init>(Lv40;Landroid/content/ContextWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb40;->a:Lv40;

    .line 5
    .line 6
    iput-object p2, p0, Lb40;->b:Landroid/content/ContextWrapper;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lwc;)V
    .locals 6

    .line 1
    iget-object p1, p1, Lwc;->a:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lb40;->a:Lv40;

    .line 7
    .line 8
    iget-object v0, p1, Lv40;->c:Lxm;

    .line 9
    .line 10
    invoke-virtual {v0}, Lxm;->b()Ljd2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Lv40;->d:Lxm;

    .line 15
    .line 16
    invoke-virtual {v1}, Lxm;->b()Ljd2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    filled-new-array {v0, v1}, [Ljd2;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, Lbe2;->y([Ljd2;)Ljd2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p1, Lv40;->b:Ljava/util/concurrent/Executor;

    .line 29
    .line 30
    new-instance v4, Lgn;

    .line 31
    .line 32
    const/4 v5, 0x3

    .line 33
    invoke-direct {v4, p1, v0, v1, v5}, Lgn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v3, v4}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Lz30;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    iget-object p0, p0, Lb40;->b:Landroid/content/ContextWrapper;

    .line 44
    .line 45
    invoke-direct {v0, p0, v1}, Lz30;-><init>(Landroid/content/ContextWrapper;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljd2;->b(Lwr0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final b(Lx40;)V
    .locals 0

    .line 1
    return-void
.end method
