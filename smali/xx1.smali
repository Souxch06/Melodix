.class public abstract Lxx1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final A:Lwx1;

.field public static final A0:Lwx1;

.field public static final B:Lwx1;

.field public static final B0:Lwx1;

.field public static final C:Lwx1;

.field public static final C0:Lwx1;

.field public static final D:Lwx1;

.field public static final D0:Lwx1;

.field public static final E:Lwx1;

.field public static final E0:Lwx1;

.field public static final F:Lwx1;

.field public static final F0:Lwx1;

.field public static final G:Lwx1;

.field public static final G0:Lwx1;

.field public static final H:Lwx1;

.field public static final H0:Lwx1;

.field public static final I:Lwx1;

.field public static final I0:Lwx1;

.field public static final J:Lwx1;

.field public static final J0:Lwx1;

.field public static final K:Lwx1;

.field public static final K0:Lwx1;

.field public static final L:Lwx1;

.field public static final L0:Lwx1;

.field public static final M:Lwx1;

.field public static final M0:Lwx1;

.field public static final N:Lwx1;

.field public static final N0:Lwx1;

.field public static final O:Lwx1;

.field public static final O0:Lwx1;

.field public static final P:Lwx1;

.field public static final P0:Lwx1;

.field public static final Q:Lwx1;

.field public static final Q0:Lwx1;

.field public static final R:Lwx1;

.field public static final R0:Lwx1;

.field public static final S:Lwx1;

.field public static final S0:Lwx1;

.field public static final T:Lwx1;

.field public static final T0:Lwx1;

.field public static final U:Lwx1;

.field public static final U0:Lwx1;

.field public static final V:Lwx1;

.field public static final V0:Lwx1;

.field public static final W:Lwx1;

.field public static final W0:Lwx1;

.field public static final X:Lwx1;

.field public static final X0:Lwx1;

.field public static final Y:Lwx1;

.field public static final Y0:Lwx1;

.field public static final Z:Lwx1;

.field public static final Z0:Lwx1;

.field public static final a:Ljava/util/List;

.field public static final a0:Lwx1;

.field public static final a1:Lwx1;

.field public static final b:Lwx1;

.field public static final b0:Lwx1;

.field public static final b1:Lwx1;

.field public static final c:Lwx1;

.field public static final c0:Lwx1;

.field public static final c1:Lwx1;

.field public static final d:Lwx1;

.field public static final d0:Lwx1;

.field public static final d1:Lwx1;

.field public static final e:Lwx1;

.field public static final e0:Lwx1;

.field public static final e1:Lwx1;

.field public static final f:Lwx1;

.field public static final f0:Lwx1;

.field public static final f1:Lwx1;

.field public static final g:Lwx1;

.field public static final g0:Lwx1;

.field public static final g1:Lwx1;

.field public static final h:Lwx1;

.field public static final h0:Lwx1;

.field public static final h1:Lwx1;

.field public static final i:Lwx1;

.field public static final i0:Lwx1;

.field public static final i1:Lwx1;

.field public static final j:Lwx1;

.field public static final j0:Lwx1;

.field public static final j1:Lwx1;

.field public static final k:Lwx1;

.field public static final k0:Lwx1;

.field public static final l:Lwx1;

.field public static final l0:Lwx1;

.field public static final m:Lwx1;

.field public static final m0:Lwx1;

.field public static final n:Lwx1;

.field public static final n0:Lwx1;

.field public static final o:Lwx1;

.field public static final o0:Lwx1;

.field public static final p:Lwx1;

.field public static final p0:Lwx1;

.field public static final q:Lwx1;

.field public static final q0:Lwx1;

.field public static final r:Lwx1;

.field public static final r0:Lwx1;

.field public static final s:Lwx1;

.field public static final s0:Lwx1;

.field public static final t:Lwx1;

.field public static final t0:Lwx1;

.field public static final u:Lwx1;

.field public static final u0:Lwx1;

.field public static final v:Lwx1;

.field public static final v0:Lwx1;

.field public static final w:Lwx1;

.field public static final w0:Lwx1;

.field public static final x:Lwx1;

.field public static final x0:Lwx1;

.field public static final y:Lwx1;

.field public static final y0:Lwx1;

.field public static final z:Lwx1;

.field public static final z0:Lwx1;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lxx1;->a:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    const-wide/16 v0, 0x2710

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v1, Lnv1;->H:Lnv1;

    .line 5
    const-string v2, "measurement.ad_id_cache_time"

    const/4 v3, 0x0

    invoke-static {v2, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->b:Lwx1;

    const-wide/32 v1, 0x36ee80

    .line 6
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    sget-object v2, Ltb0;->t:Ltb0;

    .line 7
    const-string v4, "measurement.app_uninstalled_additional_ad_id_cache_time"

    invoke-static {v4, v1, v2, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->c:Lwx1;

    const-wide/32 v4, 0x5265c00

    .line 8
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v4, Llv1;->l:Llv1;

    .line 9
    const-string v5, "measurement.monitoring.sample_period_millis"

    invoke-static {v5, v2, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->d:Lwx1;

    sget-object v4, Lkv1;->o:Lkv1;

    const-string v5, "measurement.config.cache_time"

    .line 10
    invoke-static {v5, v2, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->e:Lwx1;

    sget-object v4, Lnv1;->q:Lnv1;

    .line 11
    const-string v5, "measurement.config.url_scheme"

    const-string v6, "https"

    invoke-static {v5, v6, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->f:Lwx1;

    sget-object v4, Lmv1;->t:Lmv1;

    const-string v5, "measurement.config.url_authority"

    const-string v7, "app-measurement.com"

    .line 12
    invoke-static {v5, v7, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->g:Lwx1;

    const/16 v4, 0x64

    .line 13
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Llv1;->w:Llv1;

    .line 14
    const-string v7, "measurement.upload.max_bundles"

    invoke-static {v7, v4, v5, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v5

    sput-object v5, Lxx1;->h:Lwx1;

    const/high16 v5, 0x10000

    .line 15
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v7, Lkv1;->z:Lkv1;

    .line 16
    const-string v8, "measurement.upload.max_batch_size"

    invoke-static {v8, v5, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->i:Lwx1;

    sget-object v7, Lnv1;->B:Lnv1;

    const-string v8, "measurement.upload.max_bundle_size"

    .line 17
    invoke-static {v8, v5, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v5

    sput-object v5, Lxx1;->j:Lwx1;

    const/16 v5, 0x3e8

    .line 18
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v7, Lnv1;->E:Lnv1;

    const-string v8, "measurement.upload.max_events_per_bundle"

    .line 19
    invoke-static {v8, v5, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->k:Lwx1;

    const v7, 0x186a0

    .line 20
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v8, Lmv1;->G:Lmv1;

    const-string v9, "measurement.upload.max_events_per_day"

    .line 21
    invoke-static {v9, v7, v8, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->l:Lwx1;

    sget-object v8, Lt11;->v:Lt11;

    const-string v9, "measurement.upload.max_error_events_per_day"

    .line 22
    invoke-static {v9, v5, v8, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->m:Lwx1;

    const v8, 0xc350

    .line 23
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lmz;->y:Lmz;

    const-string v10, "measurement.upload.max_public_events_per_day"

    .line 24
    invoke-static {v10, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->n:Lwx1;

    const/16 v8, 0x2710

    .line 25
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Ltb0;->v:Ltb0;

    const-string v10, "measurement.upload.max_conversions_per_day"

    .line 26
    invoke-static {v10, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->o:Lwx1;

    const/16 v8, 0xa

    .line 27
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lok0;->x:Lok0;

    const-string v10, "measurement.upload.max_realtime_events_per_day"

    .line 28
    invoke-static {v10, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v9

    sput-object v9, Lxx1;->p:Lwx1;

    sget-object v9, Lt11;->w:Lt11;

    const-string v10, "measurement.store.max_stored_events_per_app"

    .line 29
    invoke-static {v10, v7, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->q:Lwx1;

    sget-object v7, Lkv1;->k:Lkv1;

    const-string v9, "measurement.upload.url"

    const-string v10, "https://app-measurement.com/a"

    .line 30
    invoke-static {v9, v10, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->r:Lwx1;

    sget-object v7, Llv1;->k:Llv1;

    const-string v9, "measurement.sgtm.google_signal.url"

    const-string v10, "https://app-measurement.com/s/d"

    .line 31
    invoke-static {v9, v10, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->s:Lwx1;

    sget-object v7, Lmv1;->k:Lmv1;

    .line 32
    const-string v9, "measurement.sgtm.service_upload_apps_list"

    const-string v10, ""

    invoke-static {v9, v10, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->t:Lwx1;

    sget-object v7, Lnv1;->k:Lnv1;

    const-string v9, "measurement.sgtm.upload.backoff_http_codes"

    const-string v11, "404,429,503,504"

    .line 33
    invoke-static {v9, v11, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->u:Lwx1;

    const-wide/32 v11, 0x927c0

    .line 34
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    sget-object v9, Lkv1;->l:Lkv1;

    const-string v11, "measurement.sgtm.upload.retry_interval"

    .line 35
    invoke-static {v11, v7, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v9

    sput-object v9, Lxx1;->v:Lwx1;

    const-wide/32 v11, 0x1499700

    .line 36
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    sget-object v11, Lmv1;->l:Lmv1;

    const-string v12, "measurement.sgtm.upload.retry_max_wait"

    .line 37
    invoke-static {v12, v9, v11, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v11

    sput-object v11, Lxx1;->w:Lwx1;

    const-wide/32 v11, 0x1b7740

    .line 38
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    sget-object v12, Lnv1;->l:Lnv1;

    const-string v13, "measurement.sgtm.batch.retry_interval"

    .line 39
    invoke-static {v13, v11, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v12

    sput-object v12, Lxx1;->x:Lwx1;

    sget-object v12, Lkv1;->m:Lkv1;

    const-string v13, "measurement.sgtm.batch.retry_max_wait"

    .line 40
    invoke-static {v13, v9, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v9

    sput-object v9, Lxx1;->y:Lwx1;

    sget-object v9, Llv1;->m:Llv1;

    const-string v12, "measurement.sgtm.batch.retry_max_count"

    .line 41
    invoke-static {v12, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->z:Lwx1;

    const/16 v8, 0x1388

    .line 42
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lmv1;->m:Lmv1;

    const-string v12, "measurement.sgtm.upload.max_queued_batches"

    .line 43
    invoke-static {v12, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->A:Lwx1;

    const/4 v8, 0x5

    .line 44
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lnv1;->m:Lnv1;

    const-string v12, "measurement.sgtm.upload.batches_retrieval_limit"

    .line 45
    invoke-static {v12, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->B:Lwx1;

    const-wide/16 v8, 0x1388

    .line 46
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    sget-object v9, Lkv1;->n:Lkv1;

    const-string v12, "measurement.sgtm.upload.min_delay_after_startup"

    .line 47
    invoke-static {v12, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v9

    sput-object v9, Lxx1;->C:Lwx1;

    const-wide/16 v12, 0x3e8

    .line 48
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    sget-object v12, Llv1;->n:Llv1;

    const-string v13, "measurement.sgtm.upload.min_delay_after_broadcast"

    .line 49
    invoke-static {v13, v9, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v12

    sput-object v12, Lxx1;->D:Lwx1;

    sget-object v12, Lmv1;->n:Lmv1;

    const-string v13, "measurement.sgtm.upload.min_delay_after_background"

    .line 50
    invoke-static {v13, v7, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->E:Lwx1;

    const-wide/32 v12, 0xdbba00

    .line 51
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    sget-object v12, Lnv1;->n:Lnv1;

    const-string v13, "measurement.sgtm.batch.long_queuing_threshold"

    .line 52
    invoke-static {v13, v7, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->F:Lwx1;

    const-wide/32 v12, 0x2932e00

    .line 53
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    sget-object v12, Llv1;->o:Llv1;

    const-string v13, "measurement.upload.backoff_period"

    .line 54
    invoke-static {v13, v7, v12, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->G:Lwx1;

    sget-object v7, Lmv1;->o:Lmv1;

    const-string v12, "measurement.upload.window_interval"

    .line 55
    invoke-static {v12, v1, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    sget-object v7, Lnv1;->o:Lnv1;

    const-string v12, "measurement.upload.interval"

    .line 56
    invoke-static {v12, v1, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v7

    sput-object v7, Lxx1;->H:Lwx1;

    sget-object v7, Lkv1;->p:Lkv1;

    const-string v12, "measurement.upload.realtime_upload_interval"

    .line 57
    invoke-static {v12, v0, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->I:Lwx1;

    sget-object v0, Llv1;->p:Llv1;

    const-string v7, "measurement.upload.debug_upload_interval"

    .line 58
    invoke-static {v7, v9, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->J:Lwx1;

    const-wide/16 v12, 0x1f4

    .line 59
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v7, Lmv1;->p:Lmv1;

    const-string v12, "measurement.upload.minimum_delay"

    .line 60
    invoke-static {v12, v0, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->K:Lwx1;

    const-wide/32 v12, 0xea60

    .line 61
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v7, Lnv1;->p:Lnv1;

    const-string v12, "measurement.alarm_manager.minimum_interval"

    .line 62
    invoke-static {v12, v0, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->L:Lwx1;

    sget-object v0, Lkv1;->q:Lkv1;

    const-string v7, "measurement.upload.stale_data_deletion_interval"

    .line 63
    invoke-static {v7, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->M:Lwx1;

    const-wide/32 v12, 0x240c8400

    .line 64
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v2, Llv1;->q:Llv1;

    const-string v7, "measurement.upload.refresh_blacklisted_config_interval"

    .line 65
    invoke-static {v7, v0, v2, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->N:Lwx1;

    const-wide/16 v12, 0x3a98

    .line 66
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v7, Lmv1;->q:Lmv1;

    const-string v12, "measurement.upload.initial_upload_delay_time"

    .line 67
    invoke-static {v12, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->O:Lwx1;

    sget-object v2, Lkv1;->r:Lkv1;

    const-string v7, "measurement.upload.retry_time"

    .line 68
    invoke-static {v7, v11, v2, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->P:Lwx1;

    const/4 v2, 0x6

    .line 69
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v7, Llv1;->r:Llv1;

    const-string v11, "measurement.upload.retry_count"

    .line 70
    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->Q:Lwx1;

    const-wide/32 v11, 0x1ee62800

    .line 71
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v7, Lmv1;->r:Lmv1;

    const-string v11, "measurement.upload.max_queue_time"

    .line 72
    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->R:Lwx1;

    const-wide/32 v11, 0x493e0

    .line 73
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v7, Lnv1;->r:Lnv1;

    const-string v11, "measurement.upload.google_signal_max_queue_time"

    .line 74
    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->S:Lwx1;

    const/4 v2, 0x4

    .line 75
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v7, Lkv1;->s:Lkv1;

    const-string v11, "measurement.lifetimevalue.max_currency_tracked"

    .line 76
    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->T:Lwx1;

    const/16 v2, 0xc8

    .line 77
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v7, Llv1;->s:Llv1;

    const-string v11, "measurement.audience.filter_result_max_count"

    .line 78
    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->U:Lwx1;

    .line 79
    const-string v2, "measurement.upload.max_public_user_properties"

    const/4 v7, 0x0

    invoke-static {v2, v4, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->V:Lwx1;

    const/16 v2, 0x7d0

    .line 80
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 81
    const-string v11, "measurement.upload.max_event_name_cardinality"

    invoke-static {v11, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->W:Lwx1;

    const-string v2, "measurement.upload.max_public_event_params"

    .line 82
    invoke-static {v2, v4, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->X:Lwx1;

    sget-object v2, Lmv1;->s:Lmv1;

    const-string v11, "measurement.service_client.idle_disconnect_millis"

    .line 83
    invoke-static {v11, v8, v2, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->Y:Lwx1;

    sget-object v2, Lnv1;->s:Lnv1;

    const-string v8, "measurement.service_client.reconnect_millis"

    .line 84
    invoke-static {v8, v9, v2, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v2

    sput-object v2, Lxx1;->Z:Lwx1;

    .line 85
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v8, Lkv1;->t:Lkv1;

    const-string v9, "measurement.test.test_boolean_flag"

    .line 86
    invoke-static {v9, v2, v8, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->a0:Lwx1;

    sget-object v8, Llv1;->t:Llv1;

    const-string v9, "measurement.test.test_string_flag"

    const-string v11, "---"

    .line 87
    invoke-static {v9, v11, v8, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->b0:Lwx1;

    const-wide/16 v8, -0x1

    .line 88
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    sget-object v9, Lnv1;->t:Lnv1;

    const-string v11, "measurement.test.test_long_flag"

    .line 89
    invoke-static {v11, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v9

    sput-object v9, Lxx1;->c0:Lwx1;

    sget-object v9, Lkv1;->u:Lkv1;

    .line 90
    const-string v11, "measurement.test.test_cached_long_flag"

    const/4 v12, 0x1

    invoke-static {v11, v8, v9, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    const/4 v8, -0x2

    .line 91
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Llv1;->u:Llv1;

    const-string v11, "measurement.test.test_int_flag"

    .line 92
    invoke-static {v11, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->d0:Lwx1;

    const-wide/high16 v8, -0x3ff8000000000000L    # -3.0

    .line 93
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    sget-object v9, Lmv1;->u:Lmv1;

    const-string v11, "measurement.test.test_double_flag"

    .line 94
    invoke-static {v11, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->e0:Lwx1;

    const/16 v8, 0x32

    .line 95
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lnv1;->u:Lnv1;

    const-string v11, "measurement.experiment.max_ids"

    .line 96
    invoke-static {v11, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    const/16 v8, 0x1b

    .line 97
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lkv1;->v:Lkv1;

    const-string v11, "measurement.upload.max_item_scoped_custom_parameters"

    .line 98
    invoke-static {v11, v8, v9, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->f0:Lwx1;

    const/16 v8, 0x1f4

    .line 99
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Llv1;->v:Llv1;

    const-string v11, "measurement.upload.max_event_parameter_value_length"

    .line 100
    invoke-static {v11, v8, v9, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v8

    sput-object v8, Lxx1;->g0:Lwx1;

    sget-object v8, Lmv1;->v:Lmv1;

    const-string v9, "measurement.max_bundles_per_iteration"

    .line 101
    invoke-static {v9, v4, v8, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->h0:Lwx1;

    sget-object v4, Lnv1;->v:Lnv1;

    const-string v8, "measurement.sdk.attribution.cache.ttl"

    .line 102
    invoke-static {v8, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->i0:Lwx1;

    const-wide/32 v8, 0x6ddd00

    .line 103
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v4, Lkv1;->w:Lkv1;

    const-string v8, "measurement.redaction.app_instance_id.ttl"

    .line 104
    invoke-static {v8, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->j0:Lwx1;

    const/4 v0, 0x7

    .line 105
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v4, Lmv1;->w:Lmv1;

    const-string v8, "measurement.rb.attribution.client.min_ad_services_version"

    .line 106
    invoke-static {v8, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->k0:Lwx1;

    .line 107
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v4, Lnv1;->w:Lnv1;

    const-string v8, "measurement.dma_consent.max_daily_dcu_realtime_events"

    .line 108
    invoke-static {v8, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->l0:Lwx1;

    sget-object v0, Lkv1;->x:Lkv1;

    const-string v4, "measurement.rb.attribution.uri_scheme"

    .line 109
    invoke-static {v4, v6, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->m0:Lwx1;

    sget-object v0, Llv1;->x:Llv1;

    const-string v4, "measurement.rb.attribution.uri_authority"

    const-string v6, "google-analytics.com"

    .line 110
    invoke-static {v4, v6, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->n0:Lwx1;

    sget-object v0, Lmv1;->x:Lmv1;

    const-string v4, "measurement.rb.attribution.uri_path"

    const-string v6, "privacy-sandbox/register-app-conversion"

    .line 111
    invoke-static {v4, v6, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->o0:Lwx1;

    sget-object v0, Lnv1;->x:Lnv1;

    const-string v4, "measurement.session.engagement_interval"

    .line 112
    invoke-static {v4, v1, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->p0:Lwx1;

    sget-object v0, Lkv1;->y:Lkv1;

    const-string v4, "measurement.rb.attribution.app_allowlist"

    .line 113
    invoke-static {v4, v10, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->q0:Lwx1;

    sget-object v0, Llv1;->y:Llv1;

    const-string v4, "measurement.rb.attribution.user_properties"

    const-string v6, "_npa,npa|_fot,fot"

    .line 114
    invoke-static {v4, v6, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->r0:Lwx1;

    sget-object v0, Lmv1;->y:Lmv1;

    const-string v4, "measurement.rb.attribution.event_params"

    const-string v6, "value|currency"

    .line 115
    invoke-static {v4, v6, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->s0:Lwx1;

    sget-object v0, Lnv1;->y:Lnv1;

    const-string v4, "measurement.rb.attribution.query_parameters_to_remove"

    .line 116
    invoke-static {v4, v10, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->t0:Lwx1;

    const-wide/32 v8, 0x337f9800

    .line 117
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v4, Llv1;->z:Llv1;

    const-string v6, "measurement.rb.attribution.max_queue_time"

    .line 118
    invoke-static {v6, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->u0:Lwx1;

    const/16 v0, 0x10

    .line 119
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v4, Lmv1;->z:Lmv1;

    const-string v6, "measurement.rb.attribution.max_retry_delay_seconds"

    .line 120
    invoke-static {v6, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->v0:Lwx1;

    const/16 v0, 0x5a

    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v4, Lnv1;->z:Lnv1;

    const-string v6, "measurement.rb.attribution.client.min_time_after_boot_seconds"

    .line 122
    invoke-static {v6, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->w0:Lwx1;

    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v4, Lkv1;->A:Lkv1;

    const-string v6, "measurement.rb.attribution.max_trigger_uris_queried_at_once"

    .line 124
    invoke-static {v6, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    sget-object v0, Llv1;->A:Llv1;

    const-string v4, "measurement.rb.max_trigger_registrations_per_day"

    .line 125
    invoke-static {v4, v5, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->x0:Lwx1;

    .line 126
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v4, Lmv1;->A:Lmv1;

    const-string v5, "measurement.config.bundle_for_all_apps_on_backgrounded"

    .line 127
    invoke-static {v5, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->y0:Lwx1;

    sget-object v4, Lnv1;->A:Lnv1;

    const-string v5, "measurement.config.notify_trigger_uris_on_backgrounded"

    .line 128
    invoke-static {v5, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->z0:Lwx1;

    const/16 v4, 0xbb8

    .line 129
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Lkv1;->B:Lkv1;

    const-string v6, "measurement.rb.attribution.notify_app_delay_millis"

    .line 130
    invoke-static {v6, v4, v5, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v4

    sput-object v4, Lxx1;->A0:Lwx1;

    sget-object v4, Llv1;->B:Llv1;

    const-string v5, "measurement.config.default_flag_values"

    .line 131
    invoke-static {v5, v0, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    sget-object v4, Lmv1;->B:Lmv1;

    const-string v5, "measurement.upload.diagnostic_upload_interval"

    .line 132
    invoke-static {v5, v1, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->B0:Lwx1;

    const-string v1, "measurement.quality.checksum"

    .line 133
    invoke-static {v1, v2, v7, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->C0:Lwx1;

    sget-object v1, Lkv1;->C:Lkv1;

    const-string v4, "measurement.audience.use_bundle_end_timestamp_for_non_sequence_property_filters"

    .line 134
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->D0:Lwx1;

    sget-object v1, Llv1;->C:Llv1;

    const-string v4, "measurement.audience.refresh_event_count_filters_timestamp"

    .line 135
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->E0:Lwx1;

    sget-object v1, Lmv1;->C:Lmv1;

    const-string v4, "measurement.audience.use_bundle_timestamp_for_event_count_filters"

    .line 136
    invoke-static {v4, v2, v1, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->F0:Lwx1;

    sget-object v1, Lnv1;->C:Lnv1;

    const-string v4, "measurement.sdk.collection.last_deep_link_referrer_campaign2"

    .line 137
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->G0:Lwx1;

    sget-object v1, Lkv1;->D:Lkv1;

    const-string v4, "measurement.integration.disable_firebase_instance_id"

    .line 138
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->H0:Lwx1;

    sget-object v1, Llv1;->D:Llv1;

    const-string v4, "measurement.collection.service.update_with_analytics_fix"

    .line 139
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->I0:Lwx1;

    const v1, 0x31b50

    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v4, Lnv1;->D:Lnv1;

    const-string v5, "measurement.service.storage_consent_support_version"

    .line 141
    invoke-static {v5, v1, v4, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->J0:Lwx1;

    sget-object v1, Lkv1;->E:Lkv1;

    const-string v4, "measurement.service.store_null_safelist"

    .line 142
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->K0:Lwx1;

    sget-object v1, Llv1;->E:Llv1;

    const-string v4, "measurement.service.store_safelist"

    .line 143
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->L0:Lwx1;

    sget-object v1, Lmv1;->D:Lmv1;

    const-string v4, "measurement.session_stitching_token_enabled"

    .line 144
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->M0:Lwx1;

    sget-object v1, Lkv1;->F:Lkv1;

    const-string v4, "measurement.sgtm.client.upload_on_backgrounded.dev"

    .line 145
    invoke-static {v4, v2, v1, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->N0:Lwx1;

    sget-object v1, Llv1;->F:Llv1;

    const-string v4, "measurement.rb.attribution.service"

    .line 146
    invoke-static {v4, v0, v1, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->O0:Lwx1;

    sget-object v1, Lmv1;->E:Lmv1;

    const-string v4, "measurement.rb.attribution.client2"

    .line 147
    invoke-static {v4, v0, v1, v12}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->P0:Lwx1;

    sget-object v1, Lnv1;->F:Lnv1;

    const-string v4, "measurement.rb.attribution.uuid_generation"

    .line 148
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->Q0:Lwx1;

    sget-object v1, Lkv1;->G:Lkv1;

    const-string v4, "measurement.rb.attribution.enable_trigger_redaction"

    .line 149
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->R0:Lwx1;

    sget-object v1, Lkv1;->J:Lkv1;

    const-string v4, "measurement.client.sessions.enable_fix_background_engagement"

    .line 150
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->S0:Lwx1;

    sget-object v1, Llv1;->G:Llv1;

    const-string v4, "measurement.rb.attribution.service.enable_max_trigger_uris_queried_at_once"

    .line 151
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    sget-object v1, Lmv1;->F:Lmv1;

    const-string v4, "measurement.remove_conflicting_first_party_apis.dev"

    .line 152
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    sget-object v1, Lnv1;->G:Lnv1;

    const-string v4, "measurement.rb.attribution.service.trigger_uris_high_priority"

    .line 153
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->T0:Lwx1;

    sget-object v1, Lkv1;->H:Lkv1;

    const-string v4, "measurement.experiment.enable_phenotype_experiment_reporting"

    .line 154
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->U0:Lwx1;

    sget-object v1, Llv1;->H:Llv1;

    const-string v4, "measurement.experiment.enable_passthrough_experiment_reporting"

    .line 155
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->V0:Lwx1;

    sget-object v1, Ltb0;->s:Ltb0;

    const-string v4, "measurement.set_default_event_parameters.fix_service_request_ordering"

    .line 156
    invoke-static {v4, v2, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->W0:Lwx1;

    sget-object v1, Lmz;->v:Lmz;

    const-string v4, "measurement.set_default_event_parameters.fix_app_update_logging"

    .line 157
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v1

    sput-object v1, Lxx1;->X0:Lwx1;

    sget-object v1, Lmz;->w:Lmz;

    const-string v4, "measurement.service.fix_stop_bundling_bug"

    .line 158
    invoke-static {v4, v0, v1, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->Y0:Lwx1;

    sget-object v0, Llv1;->I:Llv1;

    const-string v1, "measurement.gbraid_campaign.stop_lgclid"

    .line 159
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->Z0:Lwx1;

    sget-object v0, Lkv1;->I:Lkv1;

    const-string v1, "measurement.gbraid_campaign.deep_link_url"

    .line 160
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->a1:Lwx1;

    sget-object v0, Lok0;->v:Lok0;

    const-string v1, "gclid,gbraid,gad_campaignid"

    .line 161
    const-string v4, "measurement.gbraid_compaign.compaign_params_triggering_info_update"

    invoke-static {v4, v1, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->b1:Lwx1;

    sget-object v0, Lt11;->t:Lt11;

    const-string v1, "measurement.edpb.service"

    .line 162
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->c1:Lwx1;

    sget-object v0, Lt11;->u:Lt11;

    const-string v1, "measurement.edpb.events_cached_in_no_data_mode"

    const-string v4, "_f,_v,_cmp"

    .line 163
    invoke-static {v1, v4, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->d1:Lwx1;

    sget-object v0, Lnv1;->I:Lnv1;

    const-string v1, "measurement.robust_time_source_2"

    .line 164
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->e1:Lwx1;

    sget-object v0, Lmv1;->H:Lmv1;

    const-string v1, "measurement.manual_iap_logging.client_service"

    .line 165
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->f1:Lwx1;

    sget-object v0, Lmz;->x:Lmz;

    const-string v1, "measurement.dsid_consent_only.app_allowlist1"

    .line 166
    invoke-static {v1, v10, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->g1:Lwx1;

    sget-object v0, Ltb0;->u:Ltb0;

    const-string v1, "measurement.dsid_consent_only.app_allowlist2"

    .line 167
    invoke-static {v1, v10, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->h1:Lwx1;

    sget-object v0, Lok0;->w:Lok0;

    const-string v1, "measurement.dsid_consent_only.app_allowlist3"

    .line 168
    invoke-static {v1, v10, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->i1:Lwx1;

    sget-object v0, Lok0;->u:Lok0;

    const-string v1, "measurement.diagnostics.enabled"

    .line 169
    invoke-static {v1, v2, v0, v3}, Lxx1;->a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;

    move-result-object v0

    sput-object v0, Lxx1;->j1:Lwx1;

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/Object;Lxu1;Z)Lwx1;
    .locals 1

    .line 1
    new-instance v0, Lwx1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lwx1;-><init>(Ljava/lang/String;Ljava/lang/Object;Lxu1;)V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    sget-object p0, Lxx1;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object v0
.end method
