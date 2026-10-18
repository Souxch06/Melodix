.class public final synthetic Lq82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lmd1;

.field public final synthetic k:Lzy1;

.field public final synthetic l:Landroid/app/job/JobParameters;


# direct methods
.method public synthetic constructor <init>(Lmd1;Lzy1;Landroid/app/job/JobParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq82;->j:Lmd1;

    .line 5
    .line 6
    iput-object p2, p0, Lq82;->k:Lzy1;

    .line 7
    .line 8
    iput-object p3, p0, Lq82;->l:Landroid/app/job/JobParameters;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lq82;->k:Lzy1;

    .line 2
    .line 3
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 4
    .line 5
    const-string v1, "AppMeasurementJobService processed last upload request."

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lq82;->j:Lmd1;

    .line 11
    .line 12
    iget-object v0, v0, Lmd1;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Landroid/app/Service;

    .line 15
    .line 16
    check-cast v0, Lp82;

    .line 17
    .line 18
    iget-object p0, p0, Lq82;->l:Landroid/app/job/JobParameters;

    .line 19
    .line 20
    invoke-interface {v0, p0}, Lp82;->c(Landroid/app/job/JobParameters;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
